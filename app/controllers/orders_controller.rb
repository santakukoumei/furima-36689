class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create, :edit]
 

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
    Payjp.api_key = "SECRET"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end
  
  def contributor_confirmation
    redirect_to root_path if @item.order.present?
  end
end