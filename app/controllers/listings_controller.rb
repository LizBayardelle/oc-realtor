class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :admin_only, except: [:show, :index]

  # can only set props from zillow after setting listing, cause we need the @listing obj in here.
  before_action :set_props_from_zillow, only: :show

  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:zpid, :status, :location, :address, :citystatezip, :notes, :featured)
    end

    def set_props_from_zillow
      @listing_property_details =  ZillowApi.new.updated_property_details(@listing.zpid)
      @listing_zestimate = ZillowApi.new.zestimate(@listing.zpid)
      @listing_search_props = ZillowApi.new.deep_search_results(citystatezip: @listing.citystatezip, address: @listing.address)
    end
end
