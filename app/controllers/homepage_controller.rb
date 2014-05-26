class HomepageController < ApplicationController

  def index
    @menu        = Page.all.map {|page| OpenStruct.new href: page_path(page), title: page.title}
    @feedbacks   = Feedback.all.reverse
    @cake_images = GalleryImage.all.reverse
    @sale        = Sale.last
  end

end