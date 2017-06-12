class Slide < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => { :slide => "960x350>" }, dependent: :destroy

  # VALIDATIONS
  validates_attachment_presence     :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end