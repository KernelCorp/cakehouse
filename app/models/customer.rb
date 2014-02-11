class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :delivery
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /(\A[^-][\w+\-.]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :cake_orders, :class_name => CakeOrder
  has_many :sale_orders, :class_name => SaleOrder
end