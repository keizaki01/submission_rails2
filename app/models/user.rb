class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  mount_uploader :avatar, AvatarUploader
  has_many :roomreservations, dependent: :destroy
end
