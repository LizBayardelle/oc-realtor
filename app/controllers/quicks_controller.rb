class QuicksController < ApplicationController
  before_action :set_quick, only: [:show, :edit, :update, :destroy]

  # GET /quicks
  def index
    @quicks = Quick.all
  end

  # GET /quicks/1
  def show
  end

  # GET /quicks/new
  def new
    @quick = Quick.new
  end

  # GET /quicks/1/edit
  def edit
  end

  # POST /quicks
  def create
    @quick = Quick.new(quick_params)

    if @quick.save
      redirect_to page_path('quick_submitted'), notice: 'Thanks! You should hear from us shortly!'
    else
      render :new
    end
  end

  # PATCH/PUT /quicks/1
  def update
    if @quick.update(quick_params)
      redirect_to root_path, notice: 'Quick was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /quicks/1
  def destroy
    @quick.destroy
    redirect_to :back, notice: 'Quick was successfully destroyed.'
  end

  def make_responded
      @quick = Quick.find(params[:id])
      if @quick.update_attributes(responded: true)
          redirect_to :back
          flash[:notice] = "That message has been marked responded!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def make_unresponded
      @quick = Quick.find(params[:id])
      if @quick.update_attributes(responded: false)
          redirect_to :back
          flash[:notice] = "That message has been marked unresponded!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def archive_quick
      @quick = Quick.find(params[:id])
      if @quick.update_attributes(archived: true)
          redirect_to :back
          flash[:notice] = "That message has been archived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unarchive_quick
      @quick = Quick.find(params[:id])
      if @quick.update_attributes(archived: false)
          redirect_to :back
          flash[:notice] = "That message has been unarchived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quick
      @quick = Quick.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quick_params
      params.require(:quick).permit(:house, :name, :phone, :email, :range, :budget, :location, :bedrooms, :bathrooms, :footage, :notes, :responded, :archived)
    end
end
