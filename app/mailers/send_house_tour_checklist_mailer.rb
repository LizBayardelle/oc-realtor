class SendHouseTourChecklistMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def send_house_tour_checklist(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Your Printable House Tour Checklist from Linchpin Realty")
  end
end
