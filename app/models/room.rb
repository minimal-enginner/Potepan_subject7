class Room < ApplicationRecord
    validates :room_name, presence: true
    validates :room_content, presence: true
    validates :room_price_day, numericality: { greater_than_or_equal_to: 1 }
    validates :room_address, presence: true
    belongs_to :user
    has_many :reservations
    mount_uploader :room_image, RoomImageUploader

    def self.search(search)
      return Room.all unless search
      Room.where(['room_address LIKE ?', "%#{search}%"])
    end
  end
  