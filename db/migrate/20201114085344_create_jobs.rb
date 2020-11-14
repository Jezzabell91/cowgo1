class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :head, default: 0
      t.integer :weight, default: 0
      t.string :instructions
      t.boolean :paid, default: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
