class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]
  before_action :authenticate_user!
  before_action :commenter_or_admin, except: [:create]

  def create
    @blog = Blog.friendly.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to blog_path(@blog), notice: 'Your comment has been saved!  Once it is reviewed it will show up on the blog.'
    else
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to blog_path(@blog), notice: 'Your comment has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.friendly.find(params[:blog_id])
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    if current_user.admin
      redirect_to user_path(current_user), notice: 'Comment has been deleted.'
    else
      redirect_to blog_path(@blog), notice: 'Comment has been deleted.'
    end
  end

  def approve_comment
      @comment = Comment.find(params[:id])
      if @comment.update_attributes(approved: true)
          redirect_to :back
          flash[:notice] = "That comment has been approved!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_id, :blog_id, :approved)
    end

    def commenter_or_admin
      @comment = Comment.find(params[:id])
      unless current_user == @comment.user || current_user.admin
        flash[:alert] = "Sorry, you can't edit or delete someone else's comment."
        redirect_to [comment.post]
      end
    end
end
