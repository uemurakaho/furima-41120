class Address < ApplicationRecord
  belongs_to :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture, class_name: 'Prefecture'
  # belongs_to :prefecture

end
