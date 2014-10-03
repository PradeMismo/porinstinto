class SongsController < ApplicationController

  def new
    @record = Record.find(params[:record_id])    
    @song = Song.new
    flash.now[:tip] = "Adjunta un fichero de audio .ogg"    
  end 

  def create
    @record = Record.find(params[:record_id])    
    @song = @record.songs.new(params[:song])

    if @song.save
      flash[:success] = "Song succesfully created"
      redirect_to @record
    else
      flash[:error] = "Error: song couldn't be created"        
      redirect_to @record
    end
  end


  def edit
    @song = Song.find(params[:id])
    @record = @song.record
  end

  def update
    @song = Song.find(params[:id])
    @record = @song.record
    if @song.update_attributes(params[:song])
      flash[:success] = "Song succesfully updated"
      redirect_to @record
    else
      flash[:error] = "Error: song couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @song = Song.find(params[:id])
    @record = @song.record
    @song.destroy
    flash[:success] = 'Song deleted'
    redirect_to @record
  end
  
end
