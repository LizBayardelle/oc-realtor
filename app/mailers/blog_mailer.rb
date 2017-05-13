class BlogMailer < ApplicationMailer
  default from: "Anthony Bayardelle <anthony@ocrealtor.info>"

  def new_blog(blog, user)
    @blog = blog
    @user = user
    mail(to: @user.email, subject: @blog.title)
  end
end
