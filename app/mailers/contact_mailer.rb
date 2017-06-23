class ContactMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@calirealty.org>"

  def new_contact(contact)
    @contact = contact
    mail(to: "teambayardelle@gmail.com", subject: "New Contact Us Submission on CaliRealty")
  end
end
