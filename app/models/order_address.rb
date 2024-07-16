class OrderAddress
  include ActiveModel::Model 
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :block
    validates :phone_number, length: { in: 10..11 }, format: { with: /\A[0-9]+\z/, message: "is invalid. Input only number" }
  end
  validates :prefecture_id,  numericality: {other_than: 1, message: "can't be blank" }
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
