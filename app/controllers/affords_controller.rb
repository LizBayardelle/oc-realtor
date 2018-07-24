class AffordsController < ApplicationController
  before_action :set_afford, only: [:show, :edit, :update, :destroy]

  # GET /affords
  def index
    @affords = Afford.all
  end

  # GET /affords/1
  def show
  end

  # GET /affords/new
  def new
    @afford = Afford.new
  end

  # GET /affords/1/edit
  def edit
  end

  # POST /affords
  def create
    @afford = Afford.new(afford_params)

    if @afford.save
      redirect_to @afford, notice: 'Afford was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /affords/1
  def update
    if @afford.update(afford_params)
      redirect_to @afford, notice: 'Afford was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /affords/1
  def destroy
    @afford.destroy
    redirect_to affords_url, notice: 'Afford was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_afford
      @afford = Afford.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def afford_params
      params.require(:afford).permit(:monthly, :insurance, :tax, :dues, :downpayment, :term, :interest, :combined_tax, :email, :contact)
    end
end
