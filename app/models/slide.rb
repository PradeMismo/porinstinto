class Slide < ActiveRecord::Base
  attr_accessible :title, :description, :link, :photo, :slide_order

  has_attached_file :photo, :styles => { :slide => "960x350>" }, dependent: :destroy

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

def slide_caption
  return "caption-" + slide_order.to_s
end

end
