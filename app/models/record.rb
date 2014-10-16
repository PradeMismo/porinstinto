class Record < ActiveRecord::Base
  attr_accessible :name, :publish_date, :description, :download_link, :own, :photo
 
  has_many :songs, dependent: :destroy
  has_attached_file :photo, :styles => {:cover => "260x260>", :gallery => "300x300>"}, dependent: :destroy

  validates_presence_of :name, :publish_date, :description
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  default_scope order('publish_date ASC')

  scope :studio, where(own: true)
  scope :compilation, where(own: false)

end
