class Customer < ActiveRecord::Base
  attr_accessible :name, :email, :phone
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /(\A[^-][\w+\-.]*)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end