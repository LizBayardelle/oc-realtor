class Intake < ActiveRecord::Base
  belongs_to :user
  after_create :send_email

  private

  def send_email
    IntakeMailer.new_intake(self).deliver_now
  end
end
