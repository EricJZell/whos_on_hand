class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :ip_address
      t.datetime :last_detected
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
