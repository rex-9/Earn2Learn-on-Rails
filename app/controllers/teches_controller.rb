class TechesController < ApplicationController
  before_action :set_tech, only: %i[ show update destroy ]

  # GET /teches
  def index
    @teches = Tech.all

    render json: @teches
  end

  # GET /teches/1
  def show
    render json: @tech
  end

  # POST /teches
  def create
    @tech = Tech.new(tech_params)

    if @tech.save
      render json: @tech, status: :created, location: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teches/1
  def update
    if @tech.update(tech_params)
      render json: @tech
    else
      render json: @tech.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teches/1
  def destroy
    @tech.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech
      @tech = Tech.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tech_params
      params.require(:tech).permit(:name)
    end
end
