class ResourcesController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  before_action :members_only, only: [:show]
  before_action :admin_only, except: [:index, :show]

  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.where(active: true)
    @general = Resource.where(active: true, general: true)
    @buying = Resource.where(active: true, buying: true)
    @selling = Resource.where(active: true, selling: true)
    @loans = Resource.where(active: true, loan: true)
    @refinancing = Resource.where(active: true, refinance: true)
    @investing = Resource.where(active: true, investing: true)
    @inactive = Resource.where(active: false)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.user_id = current_user.id
    @resource.download.attach(params[:resource][:image])
    @resource.download.attach(params[:resource][:download])
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    if params[:resource][:image].present?
      @resource.image.purge
      @resource.image.attach(params[:resource][:image])
    end
    if params[:resource][:download].present?
      @resource.download.purge
      @resource.download.attach(params[:resource][:download])
    end
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def admin_only
    unless current_user && current_user.admin
      flash[:alert] = "Sorry, you have to be an admin to do that."
      redirect_to resources_path
    end
  end



  def members_only
    if params[:subscriber_sent] == "yes"
      flash[:alert] = "If you want permanent to access all of our resources, consider creating a free account."
    end
    unless current_user || params[:subscriber_sent] == "yes"
      flash[:alert] = "Sorry, you have to be a member to do that.  Create a free account to get access to our entire resource library."
      redirect_to new_user_registration_path
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(
        :title,
        :whatisit,
        :description,
        :csv_tags,
        :image,
        :primary_category,
        :general,
        :buying,
        :selling,
        :loan,
        :refinance,
        :investing,
        :resource_type,
        :link_url,
        :download,
        :active,
        :user_id
      )
    end
end
