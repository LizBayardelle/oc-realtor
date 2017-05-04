class HomeController < ApplicationController
  def index
    @listings = Listing.where(featured: true)
    @blogs = Blog.order('created_at DESC').limit(5)
  end
end
