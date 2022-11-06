class UsersController < ApplicationController
  before_action :authorize, except: [:create, :login]
  before_action :set_user, only: %i[ show update destroy ]

  # POST /users/login
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
    users = User.all.order(:id)

    render json: users, includes: [:professions, :technologies], except: [:created_at, :updated_at]
  end

  # GET /users/1
  def show
    if @user
      render json: @user, includes: [:professions, :technologies]
    else
      render json: { message: "User not found" }, status: :unprocessable_entity
    end
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
    if @user
      if @user.studies.length > 0 || @user.professions.length > 0 || @user.certificates.length > 0
        render json: { error: "User can't be deleted. This user, #{@user.username} has association to #{@user.studies.length}-Studies, #{@user.certificates.length}-Certificates and #{@user.technologies.length}-Technologies." }, status: :unprocessable_entity
      else
        if @user.destroy
          render json: { deleted: @user }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    else
      render json: { message: "User not found" }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:username, :fullname, :city, :birthdate, :email, :password)
    end
end
