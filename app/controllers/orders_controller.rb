class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @address = Address.new(address_params)
    if @order.save && @address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order).merge(item_id: @item.id, user_id: current_user.id)
  end

  def address_params
    params.require(:address).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(order_id: @order.id)
  end
end
