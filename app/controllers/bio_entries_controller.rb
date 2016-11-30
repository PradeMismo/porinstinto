class BioEntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @bio_entries = BioEntry.all
    @members = Member.all
    @band_photo = BandPhoto.first
    if current_user.try(:admin?) 
      flash.now[:tip] = "Por favor, sube una foto del grupo" unless @band_photo.present?
      flash.now[:tip] = "No hay entradas en la bio de la banda" unless @bio_entries.present?
    end 
  end


  def new
  end 

  def create
    @bio_entry = BioEntry.new(bio_entry_params)
    if @bio_entry.save
      flash[:success] = "BioEntry succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: bio_entry couldn't be created"
      redirect_to bio_entries_path flash
    end
  end


  def edit
  end

  def update
    if @bio_entry.update_attributes(bio_entry_params)
      flash[:success] = "BioEntry succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: bio_entry couldn't be updated"
      render action: "edit" 
    end
  end


  def destroy
    @bio_entry.destroy
    flash[:success] = 'BioEntry deleted'
    redirect_to bio_entries_path
  end


  private

  def bio_entry_params
    params.require(:bio_entry).permit(:title, :chapter_order, :content)
  end
end
