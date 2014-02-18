#coding: utf-8
module ApplicationHelper
  def delivery_path
    page_path Page.find_by_title 'Доставка'
  end
end
