class Job < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :addresses, as: :addressable
    accepts_nested_attributes_for :addresses
end

