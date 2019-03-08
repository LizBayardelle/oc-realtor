class IntakeMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_intake(intake)
    @intake = intake
    mail(to: "anthony@LinchpinRealty.com", subject: "Full Buyer Interview Submitted on Linchpin Realty")
  end
end
