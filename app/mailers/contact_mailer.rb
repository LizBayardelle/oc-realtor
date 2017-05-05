class ContactMailer < ApplicationMailer
  default from: "support@ocrealtor.info"

  def new_contact(contact)
    @contact = contact
    mail(to: "teambayardelle@gmail.com", subject: "New Contact Us Submission on OCR")
  end
end
