class AddPhoneNumberAndCredentialsToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :phone_number, :string
    add_column :volunteers, :credentials, :string
  end
end
