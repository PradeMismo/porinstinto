class RecordsController < ApplicationController
  load_and_authorize_resource find_by: :slug

  def index
    unless current_user.try(:admin?) 
      @albums = Record.album.published
      @singles = Record.single.published
    else
      @albums = Record.album
      @singles = Record.single
    end
  end

  def show
    @songs = @record.songs
    if current_user.try(:admin?) 
      flash.now[:info] = "Por favor, crea canciones para este disco" unless @songs.present?
    end 
  end


  def new
    flash.now[:info] = "Adjunta una imagen de 300x300. Marca la casilla 'own' si es un disco propio de estudio, o déjala en blanco si es un single."  
  end 

  def create
    @record = Record.new(record_params)
    if @record.save
      flash[:success] = "Record succesfully created"
      redirect_to records_path
    else
      flash[:error] = "Error: record couldn't be created"
      redirect_to records_path
    end
  end


  def edit
  end

  def update
    if @record.update_attributes(record_params)
      flash[:success] = "Record succesfully updated"
      redirect_to records_path
    else
      flash[:error] = "Error: record couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @record.destroy
    flash[:success] = 'Record deleted'
    redirect_to records_path
  end
  

  private

  def record_params
    params.require(:record).permit(:name, :publish_date, :description, :download_link, :own, :photo, :youtube_link, :spotify_link, :shop_link)
  end  
end