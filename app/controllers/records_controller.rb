class RecordsController < ApplicationController

  def index
    @studio_records = Record.studio
    @compilation_records = Record.compilation
  end

  def show
    @record = Record.find(params[:id])
    @songs = @record.songs
    if current_admin.present? 
      flash.now[:tip] = "Por favor, crea canciones para este disco" unless @songs.present?
    end 
    gon.songs = @songs
  end


  def new
    @record = Record.new
    flash.now[:tip] = "Adjunta una imagen de 300x300. Marca la casilla 'own' si es un disco propio de estudio, o en blanco si es un recopilatorio."  
  end 

  def create
    @record = Record.new(params[:record])

    if @record.save
      flash[:success] = "Record succesfully created"
      redirect_to records_path
    else
      flash[:error] = "Error: record couldn't be created"
      redirect_to records_path
    end
  end


  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update_attributes(params[:record])
      flash[:success] = "Record succesfully updated"
      redirect_to records_path
    else
      flash[:error] = "Error: record couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    flash[:success] = 'Record deleted'
    redirect_to records_path
  end
end
