class RemoveProfileImageAndRangeFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :profile_image, :string
    remove_column :users, :range, :integer
  end
end
