class ChangeUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.remove :company
      t.remove :website
      t.remove :description
      t.remove :capacity
      t.remove :admin_role
      ## Database authenticatable
      t.string :company, default: ""
      t.string :website, default: ""
      t.string :description, default: ""
      t.integer :capacity, default: 0
    end
  end
end
