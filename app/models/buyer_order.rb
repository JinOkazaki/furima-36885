class BuyerOrder
  include ActiveModel::Model
  attr_accessor :postal,:prefecture_id,:city,:address,:building_name,:tell_number,:order_id,:user_id,:item_id,:token

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :tell_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
    # validates :order_id
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Buyer.create(postal: postal,prefecture_id: prefecture_id,city: city,address: address,building_name: building_name,tell_number: tell_number,order_id: order.id)
  end
end