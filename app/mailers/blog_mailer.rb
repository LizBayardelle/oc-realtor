class BlogMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@linchpinrealty.com>"

  def new_blog(blog, subscriber)
    @blog = blog
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: @blog.title)
  end
end
