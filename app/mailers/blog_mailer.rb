class BlogMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@calirealty.org>"

  def new_blog(blog, user)
    @blog = blog
    @user = user
    mail(to: @user.email, subject: @blog.title)
  end
end
