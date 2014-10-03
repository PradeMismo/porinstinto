class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @entries = @tag.entries.paginate(:page => params[:page], :per_page => 2)
    @next_concert = Concert.next.order("date ASC").first
    @songs = Song.all.shuffle[0..8]
    gon.songs = @songs
  end
end
