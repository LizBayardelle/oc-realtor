class Contact < ActiveRecord::Base
  after_create :send_email

  private

  def send_email
    ContactMailer.new_contact(self).deliver_now
  end
end
