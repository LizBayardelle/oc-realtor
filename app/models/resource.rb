class Resource < ApplicationRecord
  belongs_to :user
  has_many :blogs
  has_one_attached :image
  has_one_attached :download
end
