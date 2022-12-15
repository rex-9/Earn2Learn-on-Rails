class StudiesController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :set_study, only: %i[ show update destroy ]

  # GET /users/1/studies
  def index
    @studies = User.find(params[:user_id]).studies.order(:topic)

    render json: @studies
  end

  # GET /studies
  def all
    @studies = Study.all.order(:topic)

    render json: @studies
  end

  # GET /studies/1
  def show
    if @study
      render json: @study
    else
      render json: { error: "Study not found", status: "failure" }, status: :unprocessable_entity
    end
  end

  # POST /studies
  def create
    existing_study = Study.find_by(topic: study_params[:topic], user_id: study_params[:user_id], technology_id: study_params[:technology_id])
    existing_join = Profession.find_by(user_id: study_params[:user_id], technology_id: study_params[:technology_id])

    if !existing_join
      Profession.create(user_id: study_params[:user_id], technology_id: study_params[:technology_id])
    end

    if !existing_study
      study = Study.new(study_params)
      study.save
      render json: study
    else
      render json: { error: "Duplicate Topic for the specific Technology by a specific User", status: "failure" }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studies/1
  def update
    if @study.update(study_params)
      render json: { data: @study, status: "success" }
    else
      render json: { error: @study.errors, status: "failure" }, status: :unprocessable_entity
    end
  end

  # DELETE /studies/1
  def destroy
    if @study
      if @study.destroy
        render json: { data: @study, status: "success" }
      else
        render json: { error: "Can't delete the Study" }, status: :unprocessable_entity
      end
    else
      render json: { message: "Study not found", status: "failure" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_study
      @study = Study.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def study_params
      params.permit(:topic, :experience, :completed, :hours_taken, :user_id, :technology_id)
    end
end
