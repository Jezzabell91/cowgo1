class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :head
      t.integer :weight
      t.string :instructions

      t.timestamps
    end
  end
end
