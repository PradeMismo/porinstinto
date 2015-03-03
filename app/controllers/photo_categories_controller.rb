class PhotoCategoriesController < ApplicationController

  def index
    @categories= PhotoCategory.all
    flash.now[:info] = "Actualmente no hay fotos disponibles" unless @categories.present?
  end

  def show
    @category = PhotoCategory.find(params[:id])
    @images = @category.images.paginate(:page => params[:page], :per_page => 12)
    flash.now[:info] = "Actualmente no hay fotos en este album" unless @images.present?
  end


  def new
    @category = PhotoCategory.new
    flash.now[:tip] = "Adjunta una imagen de 300x180"  
  end 

  def create
    @category = PhotoCategory.new(params[:photo_category])
    if @category.save
      flash[:success] = "PhotoCategory succesfully created"
      redirect_to photo_categories_path
    else 
      flash[:error] = "Error: category couldn't be created"
      redirect_to photo_categories_path
    end
  end


  def edit
    @category = PhotoCategory.find(params[:id])
  end

  def update
    @category = PhotoCategory.find(params[:id])
    if @category.update_attributes(params[:photo_category])
      flash[:success] = "PhotoCategory succesfully updated"
      redirect_to photo_categories_path
    else
      flash[:error] = "Error: category couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @category = PhotoCategory.find(params[:id])
    @category.destroy
    flash[:success] = 'PhotoCategory deleted'
    redirect_to photo_categories_path
  end
end
