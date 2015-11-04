class VideosController < ApplicationController

  def show
    @video = Video.find(params[:id])
  end

  def new
    @category = VideoCategory.find(params[:video_category_id])    
    @video = Video.new  
  end 

  def create
    @category = VideoCategory.find(params[:video_category_id])    
    @video = @category.videos.new(params[:video])

    if @video.save
      flash[:success] = "Video succesfully created"
      redirect_to @video
    else
      flash[:error] = "Error: video couldn't be created"
      redirect_to video_categories_path
    end
  end


  def edit
    @video = Video.find(params[:id])
    @category = @video.video_category
  end

  def update
    @video = Video.find(params[:id])
    @category = @video.video_category
    if @video.update_attributes(params[:video])
      flash[:success] = "Video succesfully updated"
      redirect_to video_categories_path
    else
      flash[:error] = "Error: video couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @video = Video.find(params[:id])
    @category = @video.video_category
    @video.destroy
    flash[:success] = 'Video deleted'
    redirect_to video_categories_path
  end
end
