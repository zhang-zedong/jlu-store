class Cart < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items, as: :products

  def total_price
    sum = 0
    cart_items.each do |cart_item|
      if cart_item.product.price.present?
        sum += cart_item.quantity * cart_item.product.price
      end
    end
    sum
  end
  def clear
    cart_items.destroy_all
  end
end
