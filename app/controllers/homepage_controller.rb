class HomepageController < ApplicationController

  def index
    @menu = Page.all.map {|page| OpenStruct.new href: page_path(page), title: page.title}
    @feedbacks = Feedback.all
    @cake_images = GalleryImage.all
    @sale = Sale.last
  end

end