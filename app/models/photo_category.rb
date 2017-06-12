class PhotoCategory < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => { :cover => "300x180>" }, dependent: :destroy
  
  # RELATIONSHIPS
  has_many :images, dependent: :destroy
  
  # VALIDATIONS
  validates_presence_of             :title
  validates_attachment_presence     :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end