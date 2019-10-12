class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:new, :create]

  # GET /subscribers
  def index
    @subscribers = Subscriber.where(unsubscribe: [nil, false])
    @unsubscribers = Subscriber.where(unsubscribe: true)
  end

  # GET /subscribers/1
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  def create
    @subscriber = Subscriber.new(subscriber_params)
    if params[:resource_id] != nil
      @subscriber.resource_id_array << params[:resource_id]
    end
    if @subscriber.save
      if params[:resource_id]
        redirect_to resource_path(params[:resource_id].to_i, params: { subscriber_sent: "yes" } )
      else
        redirect_to root_path, notice: 'All set! Check your email for the next step!'
      end
    else
      render :new
    end
  end

  # PATCH/PUT /subscribers/1
  def update
    if @subscriber.update(subscriber_params)
      redirect_to @subscriber, notice: 'Subscriber was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subscribers/1
  def destroy
    @subscriber.destroy
    redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscriber_params
      params.require(:subscriber).permit(
        :user_id,
        :first_name,
        :last_name,
        :last_name,
        :phone,
        :email,
        :tags,
        :tag_string,
        :admin_notes,
        :unsubscribe,
        resource_id_array: []
      )
    end
end
