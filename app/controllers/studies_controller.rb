class StudiesController < ApplicationController
  before_action :authorize
  before_action :set_study, only: %i[ show update destroy ]

  # GET /studies
  def index
    @studies = Study.all.order(:id)

    render json: @studies
  end

  # GET /studies/1
  def show
    if @study
      render json: @study
    else
      render json: { message: "Study not found" }, status: :unprocessable_entity
    end
  end

  # POST /studies
  def create
    @study = Study.new(study_params)

    if @study.save
      render json: @study, status: :created
    else
      render json: @study.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studies/1
  def update
    if @study.update(study_params)
      render json: @study
    else
      render json: @study.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studies/1
  def destroy
    if @study
      if @study.destroy
        render json: { deleted: @study }
      else
        render json: { error: "Can't delete the Study" }, status: :unprocessable_entity
      end
    else
      render json: { message: "Study not found" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_params
      params.permit(:topic, :user_id, :technology_id)
    end
end
