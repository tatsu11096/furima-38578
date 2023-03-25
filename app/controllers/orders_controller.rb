class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index

  before_action :set_item, only: [:index, :create,:move_to_index]
  before_action :move_to_index, only: [:index]
 
  def index
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)

    if @item_order.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )

      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:zip_code, :shipping_region_id, :city, :city_address, :building, :telephone).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def move_to_index
    if @item.order.present?
      redirect_to root_path
    elsif not user_signed_in?
      redirect_to root_path
    elsif current_user.id == @item.user_id 
      redirect_to root_path
    end
  end
  def set_item
    @item = Item.find(params[:item_id])
 
  end
end