class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :name,            presence: true
  validates :content,         presence: true
  validates :price,           presence: true, format: { 
    with: /\A[0-9]+\z/,
    numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
    message: "can't be blank"
  }
  validates :category_id,     presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :status_id,       presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :fee_status_id,   presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: {other_than: 1, message: "can't be blank" }

end
