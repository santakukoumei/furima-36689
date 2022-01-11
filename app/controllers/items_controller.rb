class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.includes(:user).order("created_at DESC")

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

  def show

  end

  def edit
    
  end

  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  #def destroy

  #end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :details_id, :price, :burdened_id, :delivery_area_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end

end
