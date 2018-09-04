class Pillar < ActiveRecord::Base
  has_many :blogs
  extend FriendlyId
  friendly_id :name, use: :slugged
end
