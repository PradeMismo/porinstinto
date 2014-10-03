class SlidesController < ApplicationController

  def index
    @slides= Slide.all
  end

  def show
    @slide = Slide.find(params[:id])
  end


  def new
    @slide = Slide.new
    flash.now[:tip] = "Adjunta una imagen de 960x350"   
  end 

  def create
    @slide = Slide.new(params[:slide])
    if @slide.save
      flash[:success] = "Slide succesfully created"
      redirect_to slides_path
    else 
      flash[:error] = "Error: slide couldn't be created"
      redirect_to slides_path
    end
  end


  def edit
    @slide = Slide.find(params[:id])
  end

  def update
    @slide = Slide.find(params[:id])
    if @slide.update_attributes(params[:slide])
      flash[:success] = "Slide succesfully updated"
      redirect_to slides_path
    else
      flash[:error] = "Error: slide couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy
    flash[:success] = 'Slide deleted'
    redirect_to slides_path
  end
end
