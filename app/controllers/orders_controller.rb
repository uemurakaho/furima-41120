class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new()
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


  private
  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
  # , item_id: @item.id, user_id: current_user.id
  # def address_params
  #   params.require(:address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(order_id: @order.id)
  # end
end
