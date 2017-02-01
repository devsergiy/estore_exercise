class Cart < ApplicationRecord
  belongs_to :user

  has_many :cart_items, -> { includes(:product) }, dependent: :destroy
  has_many :products, through: :cart_items

  def item_count
    cart_items.inject(0) { |memo, item| item.count + memo }
  end
end
