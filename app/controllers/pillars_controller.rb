class PillarsController < ApplicationController
  before_action :set_pillar, only: [:show, :edit, :update, :destroy]

  # GET /pillars
  def index
    @pillars = Pillar.order('created_at ASC')
  end

  # GET /pillars/1
  def show
    @blogs = Blog.where(pillars_id: @pillar.id).limit(6)
  end

  # GET /pillars/new
  def new
    @pillar = Pillar.new
  end

  # GET /pillars/1/edit
  def edit
  end

  # POST /pillars
  def create
    @pillar = Pillar.new(pillar_params)

    if @pillar.save
      redirect_to @pillar, notice: 'Pillar was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pillars/1
  def update
    if @pillar.update(pillar_params)
      redirect_to @pillar, notice: 'Pillar was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pillars/1
  def destroy
    @pillar.destroy
    redirect_to pillars_url, notice: 'Pillar was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pillar
      @pillar = Pillar.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pillar_params
      params.require(:pillar).permit(:name, :buyer, :seller, :active, :menu, :snippet, :description)
    end
end
