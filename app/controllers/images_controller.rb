class ImagesController < ApplicationController

  def new
    @category = PhotoCategory.find(params[:photo_category_id])    
    @image = Image.new  
  end 

  def create
    @category = PhotoCategory.find(params[:photo_category_id])    
    @image = @category.images.new(params[:image])

    if @image.save
      flash[:success] = "Image succesfully created"
      redirect_to @category
    else
      flash[:error] = "Error: image couldn't be created"
      redirect_to @category
    end
  end


  def edit
    @image = Image.find(params[:id])
    @category = @image.photo_category
  end

  def update
    @image = Image.find(params[:id])
    @category = @image.photo_category
    if @image.update_attributes(params[:image])
      flash[:success] = "Image succesfully updated"
      redirect_to @category
    else
      flash[:error] = "Error: image couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @image = Image.find(params[:id])
    @category = @image.photo_category
    @image.destroy
    flash[:success] = 'Image deleted'
    redirect_to @category
  end
end
