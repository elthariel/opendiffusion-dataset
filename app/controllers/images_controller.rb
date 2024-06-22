class ImagesController < ApplicationController
  before_action :set_collection, only: %i[index new create]
  before_action :set_image, only: %i[ show edit update destroy ]

  # GET /images
  def index
    @images = @collection.images.all
  end

  # GET /images/1
  def show
  end

  # GET /images/new
  def new
    @image = @collection.images.build
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)
    @image.collection = @collection

    if @image.save
      redirect_to @image, notice: "Image was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to @image, notice: "Image was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy!
    redirect_to images_url, notice: "Image was successfully destroyed.", status: :see_other
  end

  private
  def set_collection
    @collection = Collection.friendly.find(params[:collection_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def image_params
    params.require(:image).permit(:url)
  end
end
