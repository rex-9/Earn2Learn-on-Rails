class CommentsController < ApplicationController
  before_action :authorize, except: [:index]
  before_action :set_comment, only: %i[ destroy ]

  def index
    comments = Comment.where(study_id: params[:study_id])
    render json: comments
  end

  def user
    comments = Comment.where(user_id: params[:id])
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: { data: comment, status: "success" }, status: :created
    else
      render json: { error: comment.errors, status: "failure" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment
      if @comment.destroy
        render json: { data: @comment, status: "success" }
      else
        render json: { error: "Can't delete the Comment" }, status: :unprocessable_entity
      end
    else
      render json: { comment: @comment, message: "Comment not found", status: "failure" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.permit(:content, :user_id, :study_id, :username)
    end
end
