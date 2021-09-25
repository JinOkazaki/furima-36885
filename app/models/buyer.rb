class Buyer < ApplicationRecord
  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address
    validates :tell_number, format: {with: /\A[0-9]{10,11}\z/}
  end
end
