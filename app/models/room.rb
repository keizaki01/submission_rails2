class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  validates :room_name, presence: true
  validates :comment, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true
  validates :room_image, presence: true
  has_many :roomreservations
end
