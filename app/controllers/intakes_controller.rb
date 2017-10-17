class IntakesController < ApplicationController
  before_action :set_intake, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:create, :new]

  # GET /intakes
  def index
    @intakes = Intake.all
  end

  # GET /intakes/1
  def show
  end

  # GET /intakes/new
  def new
    @intake = Intake.new
  end

  # GET /intakes/1/edit
  def edit
  end

  # POST /intakes
  def create
    @intake = Intake.new(intake_params)
    if current_user
      @intake.user_id = current_user.id
    end
    if @intake.save
      redirect_to root_path, notice: "I'll start the search and contact you within 24 hours!"
    else
      render :new
    end
  end

  # PATCH/PUT /intakes/1
  def update
    if @intake.update(intake_params)
      redirect_to @intake, notice: 'Intake was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /intakes/1
  def destroy
    @intake.destroy
    redirect_to intakes_url, notice: 'Intake was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intake
      @intake = Intake.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def intake_params
      params.require(:intake).permit(:user_id, :current_own, :current_rent, :current_monthly_pay, :looking_for, :areas, :amenities, :price_range, :bedrooms, :reason, :looking_time, :other_agent, :other_agent_name, :seen_liked, :seen_no_buy, :when_moved, :best_times, :price_min, :price_max, :buying_with, :downpayment, :source, :budget_monthly, :met_lender, :preapproved, :preapproved_amount)
    end
end
