class Buyer < ActiveRecord::Base
  after_create :send_email

  private

  def send_email
    BuyerMailer.new_buyer(self).deliver_now
  end
end
