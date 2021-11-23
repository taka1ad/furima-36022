class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
