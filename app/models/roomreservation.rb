class Roomreservation < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person_num, presence: true, numericality: true 
  validate :start_end_check

  def start_end_check
    errors.add(:end_date, "は開始日より前の日付で登録できません。") unless
    start_date &.< end_date 
  end

  belongs_to :user, optional: true
  belongs_to :room, optional: true
end
