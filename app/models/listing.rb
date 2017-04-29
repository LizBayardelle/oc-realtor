class Listing < ActiveRecord::Base
  extend FriendlyId
  friendly_id :address, use: :slugged
end
