class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @items = Item.includes(:user)
    
  end

  def new
    @item = Item.new
  end

  def create
   
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def destroy

  #end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :details_id, :price, :burdened_id, :delivery_area_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

end
