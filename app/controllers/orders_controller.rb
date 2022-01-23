class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :prevent_url, only: [:index, :create]

  def index
    @orders_deliveries = OrdersDeliveries.new
  end

  def create 

    @orders_deliveries = OrdersDeliveries.new(order_params)
    if @orders_deliveries.valid?
      pay_item
      @orders_deliveries.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_deliveries).permit(:postal_code, :delivery_area_id, :city, :street, :building, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end


  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_1a89b3fcff5d0cfc48dd4fa5"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def prevent_url
    if @item.user_id == current_user.id || @item.order != nil
      redirect_to root_path
    end
  end
end