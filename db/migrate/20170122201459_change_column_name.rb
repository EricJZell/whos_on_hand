class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :volunteers, :ip_address, :mac_address
  end
end
