class SaleOrder < Order
  attr_accessible :sale_id
  belongs_to :sale
end