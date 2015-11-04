class VideoCategoriesController < ApplicationController

  def index
    @categories= VideoCategory.all
    flash.now[:info] = "Actualmente no hay videos disponibles" unless @categories.present?
  end


  def new
    @category = VideoCategory.new
    flash.now[:tip] = "Adjunta un link a un video de youtube"  
  end 

  def create
    @category = VideoCategory.new(params[:video_category])
    if @category.save
      flash[:success] = "VideoCategory succesfully created"
      redirect_to video_categories_path
    else 
      flash[:error] = "Error: category couldn't be created"
      redirect_to video_categories_path
    end
  end


  def edit
    @category = VideoCategory.find(params[:id])
  end

  def update
    @category = VideoCategory.find(params[:id])
    if @category.update_attributes(params[:video_category])
      flash[:success] = "VideoCategory succesfully updated"
      redirect_to video_categories_path
    else
      flash[:error] = "Error: category couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @category = VideoCategory.find(params[:id])
    @category.destroy
    flash[:success] = 'VideoCategory deleted'
    redirect_to video_categories_path
  end
end
