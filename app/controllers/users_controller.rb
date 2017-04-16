class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @contacts = Contact.where(archived: false)
    @archived_contacts = Contact.where(archived: true)
  end
end
