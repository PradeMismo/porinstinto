class Image < ActiveRecord::Base
  attr_accessible :photo, :description

  has_attached_file :photo, :styles => { :cover => "300x180#" }, dependent: :destroy

  belongs_to :photo_category

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  default_scope order("created_at DESC")

end
