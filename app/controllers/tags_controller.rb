class TagsController < ApplicationController
  load_and_authorize_resource

  def show
    @entries = @tag.entries.paginate(:page => params[:page], :per_page => 2)
    @next_concert = Concert.next.order("date ASC").first
    @songs = Song.all.shuffle[0..8]
    gon.songs = @songs
  end
  

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end