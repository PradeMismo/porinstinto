class HomeController < ApplicationController
  def index
    @slides= Slide.all
    @concerts= Concert.last(3) #.next
    @records= Record.studio.last(3)
    @videos= Video.last(3)
    @entries= Entry.last(3)
    @band_photo = BandPhoto.first
  end
end
