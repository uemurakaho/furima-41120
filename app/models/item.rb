class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category 
  belongs_to :status
  belongs_to :fee_status
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :image,           presence: true
  validates :name,            presence: true
  validates :content,         presence: true
  with_options presence: true, format: {with: /\A[0-9]+\z/} do
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},
                      presence: {message:"can't be blank"}
  end
  validates :category_id,     presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :status_id,       presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :fee_status_id,   presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :prefecture_id,   presence: true, numericality: {other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, presence: true, numericality: {other_than: 1, message: "can't be blank" }

end
