class VideoCategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @video_categories= VideoCategory.all
    @videos = Hash.new {}
    @video_categories.each do |category|
      videos_paginated = category.videos.paginate(:page => params[eval(":page"+category.id.to_s)], :per_page => 3)  
      @videos[category.id] = videos_paginated
    end
    flash.now[:info] = "Actualmente no hay videos disponibles" unless @video_categories.present?
  end


  def new
  end 

  def create
    @video_category = VideoCategory.new(video_category_params)
    if @video_category.save
      flash[:success] = "VideoCategory succesfully created"
      redirect_to video_categories_path
    else 
      flash[:error] = "Error: category couldn't be created"
      redirect_to video_categories_path
    end
  end


  def edit
  end

  def update
    if @video_category.update_attributes(video_category_params)
      flash[:success] = "VideoCategory succesfully updated"
      redirect_to video_categories_path
    else
      flash[:error] = "Error: category couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @video_category.destroy
    flash[:success] = 'VideoCategory deleted'
    redirect_to video_categories_path
  end
  

  private

  def video_category_params
    params.require(:video_category).permit(:title)
  end
end