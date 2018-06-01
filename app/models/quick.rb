class Quick < ActiveRecord::Base
  after_create :send_email

  private

  def send_email
    QuickMailer.new_quick(self).deliver_now
  end
end
