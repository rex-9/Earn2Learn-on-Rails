class ProfessionsController < ApplicationController
  before_action :authorize
  before_action :set_profession, only: %i[ show update destroy ]

  # GET /user/1/technologies
  def user
    joins = Profession.where(user_id: params[:id])
    technology_ids = joins.pluck(:technology_id)
    technologies = []
    technology_ids.map do |id|
      technologies << Technology.find(id).name
    end
    render json: technologies
  end

  # GET /technology/1/users
  def technology
    joins = Profession.where(technology_id: params[:id])
    user_ids = joins.pluck(:user_id)
    users = []
    user_ids.map do |id|
      users << User.find(id)
    end
    render json: users
  end

  # GET /professions
  # def index
  #   @professions = Profession.all

  #   render json: @professions
  # end

  # GET /professions/1
  # def show
  #   render json: @profession
  # end

  # POST /professions
  def create
    @profession = Profession.new(profession_params)

    if @profession.save
      render json: @profession, status: :created, location: @profession
    else
      render json: @profession.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /professions/1
  def update
    if @profession.update(profession_params)
      render json: @profession
    else
      render json: @profession.errors, status: :unprocessable_entity
    end
  end

  # DELETE /professions/1
  def destroy
    @profession.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profession
      @profession = Profession.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profession_params
      params.fetch(:profession, {})
    end
end
