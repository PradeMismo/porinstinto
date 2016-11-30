class EntriesController < ApplicationController
  load_and_authorize_resource

  def index
    @entries = Entry.paginate(:page => params[:page], :per_page => 4)
    @next_concert = Concert.next.order("date ASC").first
    @songs = Song.all.shuffle[0..8]
    gon.songs = @songs
  end


  def new
    @tags = Tag.all
    flash.now[:tip] = "Puedes adjuntar una imagen, link externo o link de youtube"  
  end 

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      flash[:success] = "Entry succesfully created"
      redirect_to entries_path
    else
      flash[:error] = "Error: entry couldn't be created"
      redirect_to entries_path
    end
  end


  def edit
    @tags = Tag.all 
  end

  def update
    if @entry.update_attributes(entry_params)
      flash[:success] = "Entry succesfully updated"
      redirect_to entries_path
    else
      flash[:error] = "Error: entry couldn't be updated"
      render action: "edit"
    end
  end


  def destroy
    @entry.destroy
    flash[:success] = 'Entry deleted'
    redirect_to entries_path
  end


  private

  def entry_params
    params.require(:entry).permit(:title, :publish_date, :content, :youtube_link, :external_link, :tag_id, :photo)
  end
end
