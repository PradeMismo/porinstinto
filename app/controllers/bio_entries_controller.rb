class BioEntriesController < ApplicationController

  def index
    @bio_entries = BioEntry.all
    @members = Member.all
    @band_photo = BandPhoto.first
    if current_admin.present? 
      flash.now[:tip] = "Por favor, sube una foto del grupo" unless @band_photo.present?
      flash.now[:tip] = "No hay entradas en la bio de la banda" unless @bio_entries.present?
    end 
  end


  def new
    @bio_entry = BioEntry.new
  end 

  def create
    @bio_entry = BioEntry.new(params[:bio_entry])

    if @bio_entry.save
      flash[:success] = "BioEntry succesfully created"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: bio_entry couldn't be created"
      redirect_to bio_entries_path flash
    end
  end


  def edit
    @bio_entry = BioEntry.find(params[:id])
  end

  def update
    @bio_entry = BioEntry.find(params[:id])
    if @bio_entry.update_attributes(params[:bio_entry])
      flash[:success] = "BioEntry succesfully updated"
      redirect_to bio_entries_path
    else
      flash[:error] = "Error: bio_entry couldn't be updated"
      render action: "edit" 
    end
  end


  def destroy
    @bio_entry = BioEntry.find(params[:id])
    @bio_entry.destroy
    flash[:success] = 'BioEntry deleted'
    redirect_to bio_entries_path
  end
end
