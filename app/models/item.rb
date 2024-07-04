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
  validates :price,           presence: true
  validates :category_id, numericality: {other_than: 1, message: "can't be blank" }
  validates :status_id, numericality: {other_than: 1, message: "can't be blank" }
  validates :fee_status_id, numericality: {other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: {other_than: 1, message: "can't be blank" }

end
