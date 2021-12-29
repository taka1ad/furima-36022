class BuyersController < ApplicationController
  before_action :buyer_address_method,only: [:index, :create]
  before_action :authenticate_user!,only: [:index]
  def index
    if @item.user == current_user || @item.buyer.present?
      redirect_to root_path
    end
    @buyer_address = BuyerAddress.new 
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buyer_params[:token],    
        currency: 'jpy'          
      )
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    
    def buyer_params
      params.require(:buyer_address).permit(:postal_code, :manicipality, :delivery_area_id, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    def buyer_address_method
      @item = Item.find(params[:item_id])
    end
end
