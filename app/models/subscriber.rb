class Subscriber < ApplicationRecord
  attr_accessor :tags_plain
  before_create :populate_tags
  after_create :send_email


  def send_email
    NewSubscriberMailer.new_subscriber(self).deliver_now
  end

  def populate_tags
    return if self.tags_plain.blank?
    self.tags = self.tags_plain.split(",")
  end
end
