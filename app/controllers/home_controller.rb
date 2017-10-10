class HomeController < ApplicationController
  def index
    @slides= Slide.all
    @concerts= Concert.next.last(3)
    @records= Record.studio.last(3)
    @images= Image.all
    @videos= Video.home
    @entries= Entry.last(3)
  end
end
