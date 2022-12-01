class LikesController < ApplicationController
  before_action :authorize, except: [:index]

  def index
    likes = Like.where(study_id: params[:study_id])
    render json: likes
  end

  def user
    likes = Like.where(user_id: params[:id])
    render json: likes
  end

  def create
    existing_like = Like.find_by(user_id: like_params[:user_id], study_id: like_params[:study_id])

    if !existing_like
      like = Like.new(like_params)
      if like.save
        render json: { data: like, status: "success", message: "Like Successful" }, status: :created
      else
        render json: { error: like.errors, status: "failure" }, status: :unprocessable_entity
      end
    elsif existing_like
      if existing_like.destroy
        render json: { data: existing_like, status: "success", message: "Unlike Successful" }
      else
        render json: { error: "Can't delete the Study" }, status: :unprocessable_entity
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def like_params
      params.permit(:user_id, :study_id)
    end
end
