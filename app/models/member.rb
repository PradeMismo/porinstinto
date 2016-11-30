class Member < ActiveRecord::Base
  has_attached_file :photo, :styles => { :cover => "300x180>" }, dependent: :destroy

  validates_presence_of :name, :instrument
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']  
end