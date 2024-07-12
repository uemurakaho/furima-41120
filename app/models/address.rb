class Address < ApplicationRecord
  belongs_to :order
  belongs_to :prefecture

  validates :postcode,      presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :city,          presence: true
  validates :block,         presence: true
  validates :phone_number,  presence: true, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" }
end
