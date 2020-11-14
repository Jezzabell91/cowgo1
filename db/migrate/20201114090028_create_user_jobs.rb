class CreateUserJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_jobs do |t|
      t.belongs_to :user
      t.belongs_to :jobs
      t.timestamps
    end
  end
end
