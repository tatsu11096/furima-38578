class OrdersController < ApplicationController
  require "payjp"
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id != @item.user_id && @item.order == nil
      @Delivery = Delivery.new
    else
      redirect_to root_path
    end
  end

  def create
    @delivery = delivery.new(order_params)
    if @delivery.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:delivery).permit(:zip_code, :shipping_date_id, :city, :city_address, :building, :telephone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

end
