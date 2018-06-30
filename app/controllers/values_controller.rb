class ValuesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_value, only: [:show, :edit, :update, :destroy]
  before_action :fetch_results

  # GET /values
  def index
    @values = Value.all
  end

  # GET /values/1
  def show

    begin
      now = Time.now.to_f
      @value = Value.find(params[:id])
      @results  = Zillow::Api::Client.get_search_results({ address: @value.address, citystatezip: @value.citystatezip })
      @results  = [ @results ] unless @results.is_a?(Array)
      @duration = ( Time.now.to_f - now ).round(2)
    rescue Zillow::Api::Exception::ZillowError => e
      @exception = e
    end
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  def edit
  end

  def create
    @value = Value.new(value_params)
    @value.user = current_user
    if @value.save
      redirect_to @value, notice: 'Value was successfully created.'
    else
      render :new
    end
  end

  def update
    if @value.update(value_params)
      redirect_to @value, notice: 'Value was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @value.destroy
    redirect_to :back, notice: 'Value was successfully destroyed.'
  end

  def archive_value
      @value = Value.find(params[:id])
      if @value.update_attributes(archived: true)
          redirect_to :back
          flash[:notice] = "That valuation has been archived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def unarchive_value
      @value = Value.find(params[:id])
      if @value.update_attributes(archived: false)
          redirect_to :back
          flash[:notice] = "That valuation has been unarchived!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def value_read
      @value = Value.find(params[:id])
      if @value.update_attributes(read: true)
          redirect_to :back
          flash[:notice] = "That value has been marked read!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end

  def value_unread
      @value = Value.find(params[:id])
      if @value.update_attributes(read: false)
          redirect_to :back
          flash[:notice] = "That value has been marked unread!"
      else
          redirect_to root_path
          flash[:warning] = "Oops! Something went wrong!"
      end
  end


  protected

  def fetch_results
    return unless request.post?
    begin
      now = Time.now.to_f
      @results  = Zillow::Api::Client.get_search_results params.slice(:address, :citystatezip)
      @results  = [ @results ] unless @results.is_a?(Array)
      @duration = ( Time.now.to_f - now ).round(2)
    rescue Zillow::Api::Exception::ZillowError => e
      @exception = e
    end
  end

  private
    def set_value
      @value = Value.find(params[:id])
    end

    def value_params
      params.require(:value).permit(:address, :citystatezip, :sell_timeframe, :user_id, :archived, :read, :email)
    end
end
