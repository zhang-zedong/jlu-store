class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def pay!
    self.is_paid = true
  end
end
