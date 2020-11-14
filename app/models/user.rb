class User < ApplicationRecord
  has_many :addresses, as: :addressable
  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 20, minimum: 2 }
  validates :last_name, presence: true, length: { maximum: 20, minimum: 2 }
end
