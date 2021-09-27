class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :back_index, only: [:edit,:destroy]
  before_action :sold_out_back, only: :edit

  def index
    @items = Item.all.order('created_at DESC')
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
    item_find
  end

  def edit
    item_find
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end 
  end
  
  def destroy
    item_find
    @item.destroy
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:name,:image,:explanation,:category_id,:status_id,:delivery_fee_id,:prefecture_id,:shopping_day_id,:price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def back_index
    item_find
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def sold_out_back
     item_find
     if user_signed_in? && @item.order.present?
      redirect_to root_path
     end
  end

end
