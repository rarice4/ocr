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
    # TODO: gemfile add https://github.com/meh/ruby-tesseract-ocr/issues/24
    # ENV['CFLAGS'] = '-I/usr/local/Cellar/tesseract/3.02.02/include -I/usr/local/Cellar/leptonica/1.69/include' 
    # ENV['LDFLAGS'] = '-L/usr/local/Cellar/tesseract/3.02.02/lib -L/usr/local/Cellar/leptonica/1.69/lib'
    puts "hitting create"

    @ocr = Ocr.new(ocr_params)
    puts @ocr.getHostedImage(ocr_params.image_ref) 
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
