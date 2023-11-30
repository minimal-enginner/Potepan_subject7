class Reservation < ApplicationRecord
    validates :checkin, presence: true
    validates :checkout, presence: true
    validates :person, presence: true, numericality: {greater_than: 0, message: " : 1人以上の人数を入れてください"}
    validate :date_before_start
    validate :start_end_check
    belongs_to :user
    belongs_to :room
    mount_uploader :room_image, RoomImageUploader
end

def date_before_start
    return if checkin.blank?
    errors.add(:checkin, "は今日以降のものを選択してください") if checkin < Date.today
end

def start_end_check
    if checkin != nil && checkout != nil
    errors.add(:checkout, ": 開始日以前の日付は使用できません") unless
    checkout > checkin
    end
end