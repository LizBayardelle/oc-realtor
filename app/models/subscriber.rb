class Subscriber < ApplicationRecord
  attr_accessor :tags_plain
  before_create :populate_tags
  after_create :send_email
  after_create :send_goodies


  def send_email
    NewSubscriberMailer.new_subscriber(self).deliver_now
  end

  def send_goodies
    if self.tag_string.include? 'LM-house-tour-checklist'
      SendHouseTourChecklistMailer.send_house_tour_checklist(self).deliver_now
    end
    if self.tag_string.include? 'LM-15-minute-consultation'
      SendConsultationSchedulingMailer.send_consultation_scheduling(self).deliver_now
    end
  end

  def populate_tags
    return if self.tags_plain.blank?
    self.tags = self.tags_plain.split(",")
  end
end
