class ItemsController < ApplicationController
  # ログインしていないユーザーはトップページに促す

  before_action :authenticate_user!, except: [:index]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :redirect,           only:   [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end


  def new
    @item = Item.new
  end

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
    @item = Item.find(params[:id])
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

  private

  def item_params
    params.require(:item).permit(:image, :name, :message, :category_id, :condition_id, :shipping_charge_id, :shipping_region_id,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
