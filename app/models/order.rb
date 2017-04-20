class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  def pay!
    self.update_columns(is_paid: true)
  end

  include AASM
  aasm do
    state :order_placed, :initial => true
    state :is_paid
    state :shipping
    state :shipped
    state :good_returned
    state :order_cancelled
    event :pay_order, :after_commit => :pay! do
      transitions :from => :order_placed, :to => :is_paid
    end
    event :ship do
      transitions :from => :is_paid, :to => :shipping
    end
    event :deliver do
      transitions :from => :shipping, :to => :shipped
    end
    event :cancel_order do
      transitions :from => [:order_placed, :is_paid], :to => :order_canceled
    end
    event :return_good do
      transitions :from => :shipped, :to => :good_returned
    end
  end
end
