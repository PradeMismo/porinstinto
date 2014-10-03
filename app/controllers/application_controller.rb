class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_slides

  protected

  def get_slides
    @slides= Slide.all
  end

end
