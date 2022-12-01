class TechnologiesController < ApplicationController
  before_action :authorize
  before_action :set_technology, only: %i[ show update destroy ]

  # GET /technologies
  def index
    @technologies = Technology.all.order(:id)

    render json: @technologies
  end

  # GET /technologies/1
  def show
    if @technology
      render json: @technology
    else
      render json: { message: "Technology not found" }, status: :unprocessable_entity
    end
  end

  # POST /technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      render json: @technology, status: :created
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /technologies/1
  def update
    if @technology.update(technology_params)
      render json: @technology
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /technologies/1
  def destroy
    if @technology
      if @technology.studies.length > 0 || @technology.professions.length > 0 || @technology.certificates.length > 0
        render json: { error: "Technology can't be deleted. This technology, #{@technology.name} has association to #{@technology.studies.length}-Studies, #{@technology.certificates.length}-Certificates and #{@technology.users.length}-Users." }, status: :unprocessable_entity
      else
        if @technology.destroy
          render json: { deleted: @technology }
        else
          render json: { error: "Can't delete the Technology" }, status: :unprocessable_entity
        end
      end
    else
      render json: { message: "Technology not found" }, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technology_params
      params.require(:technology).permit(:name)
    end
end
