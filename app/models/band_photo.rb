class BandPhoto < ActiveRecord::Base
  attr_accessible :photo

  has_attached_file :photo, :styles => { :band => "540x540>" }, dependent: :destroy

  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
