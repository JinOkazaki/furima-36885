class BuyersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_find, only: [:index,:create]
  before_action :another_back_index, only: :index
  before_action :user_back_index, only: :index

  def index
    @buyer_order = BuyerOrder.new
  end

  def create

    @buyer_order = BuyerOrder.new(buyer_params)
    if @buyer_order.valid?
      pay_item
      @buyer_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def buyer_params
    params.require(:buyer_order).permit(:postal,:prefecture_id,:city,:address,:building_name,:tell_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

  def item_find
    @item = Item.find(params[:id])
  end

  def another_back_index
    if item.order.present?
      redirect_to root_path
    end
  end

  def user_back_index
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

end
