class Info < ApplicationRecord
  after_create :send_email

  private

  def send_email
    NewLoanInfoMailer.new_loan_info(self).deliver_now
  end
end
