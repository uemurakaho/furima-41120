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
  validates :user,            presence: true



#   | name               | string | null: false |
# | content               | text | null: false |
# | category_id               | integer | null: false |
# | status_id               | integer | null: false |
# | fee_status_id               | integer | null: false |
# | prefecture_id               | integer | null: false |
# | days_to_ship_id               | integer | null: false |
# | price               | integer | null: false |
# | user              | references | null: false, foreign_key: true |
end
