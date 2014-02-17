#coding: utf-8
module ApplicationHelper
  def delivery_path
    page_path Page.where title: 'Доставка'
  end
end
