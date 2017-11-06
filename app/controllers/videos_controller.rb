class VideosController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def show
  end

  def new
    flash.now[:info] = "Adjunta un link a un video de youtube"      
    @video_category = VideoCategory.find(params[:video_category_id])    
  end 

  def create
    @video_category = VideoCategory.find(params[:video_category_id])    
    @video = @video_category.videos.new(video_params)

    if @video.save
      flash[:success] = "Video succesfully created"
      redirect_to @video
    else
      flash[:error] = "Error: video couldn't be created"
      redirect_to video_categories_path
    end
  end


  def edit
    @video_category = @video.video_category
  end

  def update
    @video_category = @video.video_category
    if @video.update_attributes(video_params)
      flash[:success] = "Video succesfully updated"
      redirect_to video_categories_path
    else
      flash[:error] = "Error: video couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @video_category = @video.video_category
    @video.destroy
    flash[:success] = 'Video deleted'
    redirect_to video_categories_path
  end
  

  private

  def video_params
    params.require(:video).permit(:title, :youtube_link, :description, :show)
  end
end