class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  def login
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      render json: { user: user, token: token }, status: 200, except: [:password_digest, :created_at, :updated_at]
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  # GET /users
  def index
    users = User.all

    render json: users, includes: [:users_technologies, :technologies], except: [:created_at, :updated_at]
  end

  # GET /users/1
  def show
    render json: @user, includes: [:users_technologies, :technologies]
  end

  # POST /users
  def create
    @user = User.create(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :created, except: [:password_digest, :created_at, :updated_at]
    else
      render json: @user.errors,  status: :unprocessable_entity
    end

    # if @user.save
    #   render json: @user, status: :created, location: @user
    # else
    #   render json: @user.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :fullname, :city, :birthdate, :email, :password)
    end
end
