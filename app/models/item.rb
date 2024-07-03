class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :days_to_ship
end
