class PrequalificationInfoMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_prequalification_info(info)
    @info = info
    mail(to: "anthony@LinchpinRealty.com", subject: "New Prequalification Info Submission on Linchpin Realty")
  end
end
