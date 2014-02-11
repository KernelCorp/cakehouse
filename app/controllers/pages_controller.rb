class PagesController < ApplicationController
  def show
    @page = Page.find params[:id]
    @menu = Page.all.map {|page| OpenStruct.new href: page_path(page), title: page.title}
  end
end