class SlidesController < ApplicationController
  load_and_authorize_resource

  def index
    @slides= Slide.all
  end

  def show
  end


  def new
    flash.now[:tip] = "Adjunta una imagen o vídeo de 1200x700"   
  end 

  def create
    @slide = Slide.new(slide_params)
    if @slide.save
      flash[:success] = "Slide succesfully created"
      redirect_to slides_path
    else 
      flash[:error] = "Error: slide couldn't be created"
      redirect_to slides_path
    end
  end


  def edit
  end

  def update
    if @slide.update_attributes(slide_params)
      flash[:success] = "Slide succesfully updated"
      redirect_to slides_path
    else
      flash[:error] = "Error: slide couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @slide.destroy
    flash[:success] = 'Slide deleted'
    redirect_to slides_path
  end
  
end