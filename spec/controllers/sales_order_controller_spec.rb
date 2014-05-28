#encoding: utf-8
require 'spec_helper'
require 'factory_girl_rails'

describe SaleOrdersController do
  describe 'POST#create', type: :controller do
    before do
      sale_one = FactoryGirl.create(:sale, name: 'sale_one')
      sale_two = FactoryGirl.create(:sale, name: 'sale_two')
    end
    it 'find customer' do
      Customer.create! phone: '12345', name: 'cake lover'
      post :create, sale_order: {customer: {phone: '12345', name: 'cake eater'}}
      customer = Customer.where(phone: '12345').first
      customer.name.should == 'cake eater'
    end

    it 'create customer' do
      post :create, sale_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}}
      Customer.where(email: 'new@mail.ru').length.should == 1
    end

    #it 'invalid email' do
    #  post :create, sale_order: {customer: {email: 'new@mail', phone: '222222', name: 'cake eater'}}
    #  expect(response.status).to eq(422)
    #end

    it 'should get last sale' do
      post :create, sale_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}}
      sale_order = assigns(:sale_order)
      sale_order.sale.name.should == 'sale_two'
    end

    it 'should get na error without sales' do
      Sale.all.each do |sale|
        sale.destroy
      end
      post :create, sale_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}}
      expect(response.status).to eq(422)
    end

    it 'check mailer body' do
      post :create, sale_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}}
      mail = assigns :mail
      mail.body.encoded.should include 'cake eater'
      mail.body.encoded.should include '222222'
      mail.body.encoded.should include 'sale_two'
      mail.body.encoded.should include 'sale sale'
    end

  end
end
