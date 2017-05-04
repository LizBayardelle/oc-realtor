class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @contacts = Contact.where(archived: false)
    @archived_contacts = Contact.where(archived: true)
  end

  def subscribe_to_blog
    @user = current_user
    if @user.update_attributes(blog_emails: true)
        redirect_to :back
        flash[:notice] = "You'll be the first to know about any new information!"
    else
        redirect_to root_path
        flash[:warning] = "Oops! Something went wrong!"
    end
  end
end
