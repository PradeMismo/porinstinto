class PhotoCategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @photo_categories= PhotoCategory.all
    flash.now[:info] = "Actualmente no hay fotos disponibles" unless @photo_categories.present?
  end

  def show
    @images = @photo_category.images.paginate(:page => params[:page], :per_page => 12)
    flash.now[:info] = "Actualmente no hay fotos en este album" unless @images.present?
  end


  def new
    flash.now[:info] = "Adjunta una imagen de 300x180"  
  end 

  def create
    @photo_category = PhotoCategory.new(photo_category_params)
    if @photo_category.save
      flash[:success] = "PhotoCategory succesfully created"
      redirect_to photo_categories_path
    else 
      flash[:error] = "Error: category couldn't be created"
      redirect_to photo_categories_path
    end
  end


  def edit
  end

  def update
    if @photo_category.update_attributes(photo_category_params)
      flash[:success] = "PhotoCategory succesfully updated"
      redirect_to photo_categories_path
    else
      flash[:error] = "Error: category couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @photo_category.destroy
    flash[:success] = 'PhotoCategory deleted'
    redirect_to photo_categories_path
  end


  private

  def photo_category_params
    params.require(:photo_category).permit(:title, :photo)
  end  
end
