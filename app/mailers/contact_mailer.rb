class ContactMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_contact(contact)
    @contact = contact
    mail(to: "anthony@LinchpinRealty.com", subject: "New Contact Us Submission on Linchpin Realty")
  end
end
