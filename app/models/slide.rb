class Slide < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => { :slide => "1280x720#", :index => "640x480#", }, dependent: :destroy
  #has_attached_file :video, :styles => {
  #  :medium => { :geometry => "640x480", :format => 'mp4' },
  #  :thumb => { :geometry => "640x480#", :format => 'jpg', :time => 10 }
  #}, :processors => [:transcoder]

  # VALIDATIONS
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  #validates_attachment_content_type :video, :content_type => ['video/mp4']

end