class BandPhotosController < ApplicationController
  load_and_authorize_resource

  def new
    flash.now[:info] = "Adjunta una imagen de 540px de ancho"    
  end 

  def create
    if @band_photo.save
      flash[:success] = "BandPhoto succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: BandPhoto couldn't be created"
      redirect_to bio_entries_path
    end
  end


  def edit
  end

  def update
    if @band_photo.update_attributes(band_photo_params)
      flash[:success] = "BandPhoto succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: BandPhoto couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @band_photo.destroy
    flash[:success] = 'BandPhoto deleted'
    redirect_to bio_entries_path
  end


  private

  def band_photo_params
    params.require(:band_photo).permit(:photo)
  end
end
