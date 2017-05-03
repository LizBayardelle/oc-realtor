class Listing < ActiveRecord::Base
  extend FriendlyId
  friendly_id :address, use: :slugged

  def listing_property_details
    ZillowApi.new.updated_property_details(zpid)
  end

  def listing_zestimate
    ZillowApi.new.zestimate(zpid)
  end

  def listing_search_props
    ZillowApi.new.deep_search_results(citystatezip: citystatezip, address: address)
  end
end
