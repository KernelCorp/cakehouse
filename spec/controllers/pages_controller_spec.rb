require 'spec_helper'

describe PagesController do
  before do
    FactoryGirl.create(:page, title: 'page one')
    FactoryGirl.create(:page, title: 'page two')
  end
  describe 'get#show' do
    it 'page and menu' do
      get :show, id: 'page-one'
      assigns(:page).title.should == 'page one'
      menu = assigns(:menu)
      menu.length.should == Page.all.length
      menu.first.href.should == '/pages/page-one'
      menu.last.href.should == '/pages/page-two'
    end
  end
end