class HomeController < ApplicationController
  def index
    @listings = Listing.where(featured: true)
  end
end
