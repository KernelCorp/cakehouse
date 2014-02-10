require '../spec_helper'

describe 'Customer' do
  it 'email presence' do
    customer = Customer.new email: nil
    customer.should_not be_valid
  end

  it 'email uniqueness' do
    customer_one = Customer.create! email: 'cus@tom.er'
    customer_two = Customer.new email: 'cus@tom.er'
    customer_two.should_not be_valid
  end

  it 'email format' do
    customer = Customer.new email: 'foo'
    customer.should_not be_valid
    customer = Customer.new email: 'foo.bar'
    customer.should_not be_valid
    customer = Customer.new email: 'foo@bar'
    customer.should_not be_valid
    customer = Customer.new email: '-foo@bar.bar'
    customer.should_not be_valid
  end

end