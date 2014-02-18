#coding: utf-8
module ApplicationHelper
  def delivery_path
    delivery_page = Page.find_by_title 'Доставка'
    delivery_page.nil? ? '/' : page_path(delivery_page)
  end
end
