class ItemsController < ApplicationController
  # ログインしていないユーザーはトップページに促す

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # before_action :redirect,           only:   [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
    return unless @item.user_id != current_user.id || !@item.order.nil?
  
    redirect_to root_path and return
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    return unless user_signed_in? && current_user.id == @item.user_id

    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :message, :category_id, :condition_id, :shipping_charge_id, :shipping_region_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
