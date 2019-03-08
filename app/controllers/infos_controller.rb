class InfosController < ApplicationController
  before_action :set_info, only: [:show, :edit, :update, :destroy]

  # GET /infos
  def index
    @infos = Info.all
  end

  # GET /infos/1
  def show
  end

  # GET /infos/new
  def new
    @info = Info.new
  end

  # GET /infos/1/edit
  def edit
  end

  # POST /infos
  def create
    @info = Info.new(info_params)

    if @info.save
      redirect_to root_path, notice: 'Congratulations!  Your results will be sent to your email address!'
    else
      render :new
    end
  end

  # PATCH/PUT /infos/1
  def update
    if @info.update(info_params)
      redirect_to @info, notice: 'Info was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /infos/1
  def destroy
    @info.destroy
    redirect_to infos_url, notice: 'Info was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def info_params
      params.require(:info).permit(:first_name, :last_name, :email, :phone, :goal, :residence_type, :residence_use, :timeframe, :first_time, :military, :agent, :purchase_price, :downpayment, :credit_score, :late_payments, :foreclosures, :bankruptcy, :read, :archived)
    end
end
