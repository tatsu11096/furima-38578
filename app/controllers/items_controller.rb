class ItemsController < ApplicationController
  # ログインしていないユーザーはトップページに促す
  before_action :authenticate_user!, only: [:new, :edit]
  

  
  def index
     @items = Item.all
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



  def item_params
    params.require(:item).permit(:image,:name,:messege,:category_id,:condition_id,:shipping_charge_id,:shipping_region_id,:shipping_date_id,:price).merge(user_id: current_user.id)
  end

end
