class ImagesController < ApplicationController
  load_and_authorize_resource

  def new
    @photo_category = PhotoCategory.find_by_slug(params[:photo_category_id])    
  end 

  def create
    @photo_category = PhotoCategory.find_by_slug(params[:photo_category_id])    
    @image = @photo_category.images.new(image_params)
    if @image.save
      flash[:success] = "Image succesfully created"
      redirect_to @photo_category
    else
      flash[:error] = "Error: image couldn't be created"
      redirect_to @photo_category
    end
  end


  def edit
    @photo_category = @image.photo_category
  end

  def update
    @photo_category = @image.photo_category
    if @image.update_attributes(image_params)
      flash[:success] = "Image succesfully updated"
      redirect_to @photo_category
    else
      flash[:error] = "Error: image couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @photo_category = @image.photo_category
    @image.destroy
    flash[:success] = 'Image deleted'
    redirect_to @photo_category
  end


  private

  def image_params
    params.require(:image).permit(:photo, :description)
  end
end
