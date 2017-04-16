class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @contacts = Contact.where(archived: false)
    @archived_contacts = Contact.where(archived: true)
  end

  private

    def archive_contact
        @contact = Contact.find(params[:id])
        if @contact.update_attributes(archived: true)
            redirect_to :back
            flash[:notice] = "That message has been archived!"
        else
            redirect_to root_path
            flash[:warning] = "Oops! Something went wrong!"
        end
    end

    def unarchive_contact
        @contact = Contact.find(params[:id])
        if @contact.update_attributes(archived: false)
            redirect_to :back
            flash[:notice] = "That message has been unarchived!"
        else
            redirect_to root_path
            flash[:warning] = "Oops! Something went wrong!"
        end
    end
end
