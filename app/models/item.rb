class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :Prefecture
  belongs_to :shopping_day

  with_options presence: true do
    validates :name
    validates :image
    validates :explanation
    validates :category_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :status_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :delivery_fee_id, numericality: {other_that: 1, message: "can't be blank"}
    validates :Prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :shopping_day_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :price, numericality: {in: 300..9999999,message: "is out of setting range"}
                      format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters"}
  end
end
