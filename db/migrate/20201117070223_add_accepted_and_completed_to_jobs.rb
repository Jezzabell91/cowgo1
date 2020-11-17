class AddAcceptedAndCompletedToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :accepted, :boolean, default: false
    add_column :jobs, :completed, :boolean, default: false
  end
end
