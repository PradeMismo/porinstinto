class HomeController < ApplicationController
  def index
    @slides= Slide.all
    @concerts= Concert.next.last(3)
    # Gallery
    @records= Record.studio.last(3)
    @entries= Entry.last(3)
    @band_photo = BandPhoto.first
  end
end
