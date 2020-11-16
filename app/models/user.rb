class User < ApplicationRecord
  has_many :addresses, as: :addressable
  has_and_belongs_to_many :jobs
  has_one_attached :profile_image, dependant: :purge
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 20, minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 20, minimum: 2 }
end
