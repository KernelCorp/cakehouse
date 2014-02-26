#encoding: utf-8
require 'spec_helper'

describe CakeOrdersController do
  describe 'POST#create', type: :controller do
    it 'find customer' do
      Customer.create! email: 'un@iq.ue', phone: '12345', name: 'cake lover'
      post :create, cake_order: {customer: {email: 'un@iq.ue', phone: '222222', name: 'cake eater'}}
      customer = Customer.where(email: 'un@iq.ue').first
      customer.name.should == 'cake eater'
      customer.phone.should == '222222'
    end

    it 'create customer' do
      post :create, cake_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}}
      Customer.where(email: 'new@mail.ru').length.should == 1
    end

    it 'invalid email' do
      post :create, cake_order: {customer: {email: 'new@mail', phone: '222222', name: 'cake eater'}}
      expect(response.status).to eq(422)
    end

    it 'cake order should be created' do
      post :create, cake_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}, stuff: 'some stuff'}
      order = CakeOrder.all.last
      order.stuff.should == 'some stuff'
      order.customer.email.should == 'new@mail.ru'
    end

    it 'check mailer from and to' do
      post :create, cake_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}, stuff: 'some stuff'}
      mail = assigns :mail
      mail.to.should == ['like@cakehouse.me']
      mail.from.should == ['like@cakehouse.me']
    end

    it 'check mailer body' do
      post :create, cake_order: {customer: {email: 'new@mail.ru', phone: '222222', name: 'cake eater'}, stuff: 'some stuff'}
      mail = assigns :mail
      mail.body.encoded.should include 'cake eater'
      mail.body.encoded.should include '222222'
      mail.body.encoded.should include 'some stuff'
    end
  end
end