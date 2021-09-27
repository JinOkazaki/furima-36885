class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shopping_day

  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :status_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :delivery_fee_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :shopping_day_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :price, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999} 
  end

end
