class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, -> { includes(:product) }
  has_many :products, through: :cart_items
end
