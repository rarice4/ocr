class OcrsController < ApplicationController
  before_action :set_ocr, only: [:show, :update, :destroy]

  # GET /ocrs
  def index
    @ocrs = Ocr.all

    render json: @ocrs
  end

  # GET /ocrs/1
  def show
    render json: @ocr
  end

  # POST /ocrs
  def create
    puts "hitting create" 
    @ocr = Ocr.new(ocr_params)

    if @ocr.save
      render json: @ocr, status: :created, location: @ocr
    else
      render json: @ocr.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ocrs/1
  def update
    if @ocr.update(ocr_params)
      render json: @ocr
    else
      render json: @ocr.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ocrs/1
  def destroy
    @ocr.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocr
      @ocr = Ocr.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ocr_params
      params.require(:ocr).permit(:image_ref)
    end
end
