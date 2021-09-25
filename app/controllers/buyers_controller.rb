class BuyersController < ApplicationController
  def index
    @buyer = Buyer.all
  end
end
