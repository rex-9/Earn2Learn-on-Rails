class CertificatesController < ApplicationController
  before_action :authorize
  before_action :set_certificate, only: %i[ show update destroy ]

  # GET /certificates
  def index
    @certificates = Certificate.all.order(:id)

    render json: @certificates
  end

  # GET /certificates/1
  def show
    if @certificate
      render json: @certificate
    else
      render json: { message: "Certificate not found" }, status: :unprocessable_entity
    end
  end

  # POST /certificates
  def create
    @certificate = Certificate.create(certificate_params)

    if @certificate
      render json: @certificate, status: :created
    else
      render json: @certificate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /certificates/1
  def update
    if @certificate.update(certificate_params)
      render json: @certificate
    else
      render json: @certificate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /certificates/1
  def destroy
    if @certificate
      if @certificate.destroy
        render json: { deleted: @certificate }
      else
        render json: { error: "Can't delete the Certificate" }, status: :unprocessable_entity
      end
    else
      render json: { message: "Certificate not found" }, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_certificate
      @certificate = Certificate.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def certificate_params
      params.permit(:title, :link, :user_id, :technology_id)
    end
end
