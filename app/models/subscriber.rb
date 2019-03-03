class Subscriber < ApplicationRecord
  attr_accessor :tags_plain
  before_create :populate_tags

  def populate_tags
    return if self.tags_plain.blank?
    self.tags = self.tags_plain.split(",")
  end
end
