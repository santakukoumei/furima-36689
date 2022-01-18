class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @orders_deliveries = OrdersDeliveries.new
  end

  def create 
    @orders_deliveries = OrdersDeliveries.new(order_params)
    if @orders_deliveries.valid?
      @orders_deliveries.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:orders_deliveries).permit(:postal_code, :delivery_area_id, :city, :street, :building, :telephone_number).merge(user_id: current_user.id)
  end

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :details_id, :price, :burdened_id, :delivery_area_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end