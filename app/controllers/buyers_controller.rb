class BuyersController < ApplicationController
  before_action :set_buyer, only: [:show, :edit, :update, :destroy]

  # GET /buyers
  def index
    @buyers = Buyer.all
  end

  # GET /buyers/1
  def show
  end

  # GET /buyers/new
  def new
    @buyer = Buyer.new
  end

  # GET /buyers/1/edit
  def edit
  end

  # POST /buyers
  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to root_path, notice: 'Your form has been successfully submitted.  You can expect to hear back from us soon!'
    else
      render :new
    end
  end

  # PATCH/PUT /buyers/1
  def update
    if @buyer.update(buyer_params)
      redirect_to @buyer, notice: 'Buyer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /buyers/1
  def destroy
    @buyer.destroy
    redirect_to buyers_url, notice: 'Buyer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buyer
      @buyer = Buyer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def buyer_params
      params.require(:buyer).permit(:buyer_name, :phone_mobile, :phone_home, :phone_work, :phone_fax, :email, :employer, :search_time, :other_agent, :address, :family_size, :own_or_rent, :current_mortgage, :need_sell, :lease_length, :really_liked, :why_not, :move_time, :why_move_time, :price_range, :qualified, :lender, :downpayment, :monthly_budget, :bedrooms, :square_feet, :units, :location, :style, :decision, :helper, :requirements, :use_as_agent, :times, :communication, :best_time, :sites, :other_information)
    end
end
