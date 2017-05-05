class Listing < ActiveRecord::Base
  extend FriendlyId
  friendly_id :address, use: :slugged
  has_attached_file :default_image
  validates_attachment_content_type :default_image, content_type: /\Aimage\/.*\z/
  after_create :send_email

  def listing_property_details
    ZillowApi.new.updated_property_details(zpid)
  end

  def listing_zestimate
    ZillowApi.new.zestimate(zpid)
  end

  def listing_search_props
    ZillowApi.new.deep_search_results(citystatezip: citystatezip, address: address)
  end

  private

  def send_email
    User.where(buyer: true, status_confirmed: true).each do |user|
      NewListingMailer.new_listing(self, user).deliver_now
    end
  end
end
