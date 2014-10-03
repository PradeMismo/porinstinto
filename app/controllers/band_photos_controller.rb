class BandPhotosController < ApplicationController

  def new
    @band_photo = BandPhoto.new
    flash.now[:tip] = "Adjunta una imagen de 540px de ancho"    
  end 

  def create
    @band_photo = BandPhoto.new(params[:band_photo])

    if @band_photo.save
      flash[:success] = "BandPhoto succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: BandPhoto couldn't be created"
      redirect_to bio_entries_path
    end
  end


  def edit
    @band_photo = BandPhoto.find(params[:id])
  end

  def update
    @band_photo = BandPhoto.find(params[:id])
    if @band_photo.update_attributes(params[:band_photo])
      flash[:success] = "BandPhoto succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: BandPhoto couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @band_photo = BandPhoto.find(params[:id])
    @band_photo.destroy
    flash[:success] = 'BandPhoto deleted'
    redirect_to bio_entries_path
  end
end
