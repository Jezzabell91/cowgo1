class Job < ApplicationRecord
    has_many :user_jobs
    has_many :users, through: :user_jobs
    has_many :addresses, as: :addressable
    accepts_nested_attributes_for :addresses

end
