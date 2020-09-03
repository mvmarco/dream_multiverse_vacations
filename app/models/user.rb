class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable      
  has_many :dimensions, dependent: :destroy
  has_many :bookings, dependent: :destroy 
  has_many :reviews, through: :bookings
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :photo
end
