class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  # GET /blogs
  def index
    if params[:tag]
      @blogs = Blog.tagged_with(params[:tag])
    else
      @blogs = Blog.all
    end
    if current_user
      @user = current_user
    end
  end

  # GET /blogs/1
  def show
    @comment = @blog.comments.build
    @comments = Comment.where(blog_id: @blog.id, approved: true)
    if current_user
      @user = current_user
    end
  end

  def download_pdf
    @blog = Blog.friendly.find(params[:id])
    send_file File.new(Rails.root.join(@blog.link_filename)), type: "application/pdf"
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
    if current_user.id = 1
      @blog.user_id = 2
    else
      @blog.user = current_user
    end

    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:title, :teaser, :body, :user_id, :image, :tag_list, :link_text, :link_filename)
    end

end
