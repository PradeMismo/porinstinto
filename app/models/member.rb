class Member < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => { :cover => ""}, :convert_options => { :cover => "-gravity north -thumbnail 300x300^ -extent 300x300" }, dependent: :destroy

  # VALIDATIONS
  validates_presence_of             :name,  :instrument
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']  
end