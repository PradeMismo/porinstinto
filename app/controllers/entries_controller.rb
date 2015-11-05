class EntriesController < ApplicationController

  def index
    @entries = Entry.paginate(:page => params[:page], :per_page => 4)
    @next_concert = Concert.next.order("date ASC").first
    @songs = Song.all.shuffle[0..8]
    gon.songs = @songs
  end


  def new
    @entry = Entry.new
    @tags = Tag.all
    flash.now[:tip] = "Puedes adjuntar una imagen, link externo o link de youtube"  
  end 

  def create
    @entry = Entry.new(params[:entry])

    if @entry.save
      flash[:success] = "Entry succesfully created"
      redirect_to entries_path
    else
      flash[:error] = "Error: entry couldn't be created"
      redirect_to entries_path
    end
  end


  def edit
    @entry = Entry.find(params[:id])
    @tags = Tag.all 
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params[:entry])
      flash[:success] = "Entry succesfully updated"
      redirect_to entries_path
    else
      flash[:error] = "Error: entry couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    flash[:success] = 'Entry deleted'
    redirect_to entries_path
  end

end
