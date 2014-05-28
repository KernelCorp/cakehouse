class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :phone, :delivery
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  #validates_format_of :email, :with => /(\A[^-][\w+\-.]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  has_many :cake_orders, :class_name => CakeOrder
  has_many :sale_orders, :class_name => SaleOrder
  before_save :set_delivery
  def set_delivery
    if self.delivery != true && self.delivery != false
      self.delivery == 'on' ? write_attribute(:delivery, true) : write_attribute(:delivery, false)
    end
    true
  end
end