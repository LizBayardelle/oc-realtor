class SendSellerMistakesMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def send_seller_mistakes(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "10 Mistakes People Make When Selling a House from Linchpin Realty")
  end
end
