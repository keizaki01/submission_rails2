class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  validates :room_name, presence: true
  validates :comment, presence: true
  validates :price, presence: true, numericality: true
  validates :address, presence: true
  validates :room_image, presence: true
  has_many :roomreservations, dependent: :destroy

  # def search(keyword)
  #   if keyword
  #     Room.where(["address like? OR comment like?", "%#{keyword}%", "%#{keyword}%"])
  #   else
  #     Room.all
  #   end
  #  end

  def self.search(search)
    if search
      Room.where(['address LIKE ?', "%#{search}%"])
    else
      Room.all
    end
  end
end
