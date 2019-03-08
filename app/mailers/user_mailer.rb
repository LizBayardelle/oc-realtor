class UserMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_user(user)
    @user = user
    mail(to: "anthony@LinchpinRealty.com", subject: "New Client Registered on Linchpin Realty")
  end
end
