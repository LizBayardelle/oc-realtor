class Subscriber < ApplicationRecord
  attr_accessor :tags_plain
  before_create :populate_tags
  after_create :send_goodies
  after_create :check_for_duplicate_subscribers
  after_create :send_email


  def send_email
    Subscriber.all.each do |subscriber|
      if subscriber.email == self.email
        return
      end
    end
    NewSubscriberMailer.new_subscriber(self).deliver_now
  end

  def send_goodies
    if self.tag_string.include? 'LM-house-tour-checklist'
      SendHouseTourChecklistMailer.send_house_tour_checklist(self).deliver_now
    end
    if self.tag_string.include? 'LM-mistakes-sellers-make'
      SendSellerMistakesMailer.send_seller_mistakes(self).deliver_now
    end
    if self.tag_string.include? 'LM-15-minute-consultation'
      SendConsultationSchedulingMailer.send_consultation_scheduling(self).deliver_now
    end
  end

  def populate_tags
    return if self.tags_plain.blank?
    self.tags = self.tags_plain.split(",")
  end

  def check_for_duplicate_subscribers
    Subscriber.all.each do |subscriber|
      if subscriber.email == self.email && self.tag_string != ""
        subscriber.tag_string << ", " + self.tag_string
        subscriber.save
        self.delete
      end
    end
  end

end
