class PhotoCategory < ActiveRecord::Base
  has_attached_file :photo, :styles => { :cover => "300x180>" }, dependent: :destroy
  has_many :images, dependent: :destroy

  validates_presence_of :title
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end