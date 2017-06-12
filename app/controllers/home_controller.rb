class HomeController < ApplicationController
  def index
    @slides= Slide.all
    @concerts= Concert.last(5)
  end
end
