class Roomreservation < ApplicationRecord
  # mount_uploader :room_image, RoomImageUploader
  belongs_to :user, optional: true
  belongs_to :room, optional: true
end
