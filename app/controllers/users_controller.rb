class UsersController < ApplicationController
  before_action :authorize, except: [:create, :login, :index, :show]
  before_action :set_user, only: %i[ show update destroy ]

  # POST /users/login
  def login
    user = User.where('username LIKE :query OR email LIKE :query', query: "%#{params[:auth]}%").first
    if user
      if user.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { user: user, token: token, status: "success" }, status: 200, except: [:password_digest, :created_at, :updated_at]
      else
        render json: { error: "Invalid Password", status: "failure" }, status: :unauthorized
      end
    else
      render json: { error: "User not found", status: "failure" }, status: :unauthorized
    end
  end

  # GET /users
  def index
    users = User.all.order(:id)

    render json: users, includes: [:professions, :technologies], except: [:created_at, :updated_at]
  end

  # GET /users/1
  def show
    if @user
      render json: @user
    else
      render json: { message: "User not found", status: "failure" }, status: :unprocessable_entity
    end
  end

  # POST /users
  def create
    user = User.create(user_params)

    if user.valid?
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token, status: "success" }, status: :created, except: [:password_digest, :created_at, :updated_at]
    else
      render json: { error: user.errors.full_messages, status: "failure"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { data: @user, status: "success" }
    else
      render json: { error: @user.errors.full_messages, status: "failure" }, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    if @user
      if @user.studies.length > 0 || @user.professions.length > 0 || @user.certificates.length > 0
        render json: { error: "User can't be deleted. This user, #{user.username} has association to #{user.studies.length}-Studies, #{user.certificates.length}-Certificates and #{user.technologies.length}-Technologies." }, status: :unprocessable_entity
      else
        if @user.destroy
          render json: { deleted: @user }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { message: "User not found", status: "failure" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :fullname, :bio, :city, :phone, :birthdate, :email, :password, :image, :github, :linkedin)
    end
end
