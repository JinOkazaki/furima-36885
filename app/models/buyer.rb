class Buyer < ApplicationRecord
  belongs_to :order#, optional: true
end
