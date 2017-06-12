class Image < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => { :cover => "300x180#" }, dependent: :destroy
  
  # RELATIONSHIPS
  belongs_to :photo_category

  # VALIDATIONS
  validates_attachment_presence     :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  # SCOPES
  default_scope  { order(:created_at => :desc) }
end