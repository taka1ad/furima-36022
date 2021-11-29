class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show, :destroy]
  before_action :set_method,only: [:show, :edit, :update, :destroy]
  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_method
    @item = Item.find(params[:id])
  end
end
