class LikesController < ApplicationController
  def index do
    @likes = Like.all
    render json: @likes, include: [:user, :study], except: [:created_at, :updated_at]
  end
end
