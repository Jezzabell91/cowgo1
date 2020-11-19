class AddRolesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :transporter_role, :boolean, default: false
    add_column :users, :livestock_owner_role, :boolean, default: false
  end
end
