class Song < ActiveRecord::Base
  attr_accessible :name, :lyrics, :track_order, :music_file, :url

  has_attached_file :music_file, dependent: :destroy

  validates_presence_of :name, :lyrics, :track_order, :record_id
  validates_attachment_presence :music_file
  validates_attachment_content_type :music_file, :content_type => ['application/ogg', 'audio/ogg', 'video/ogg']

  belongs_to :record

  default_scope order('track_order ASC')

  before_validation :set_file_url

  private

  def set_file_url
    self.url = music_file.url
  end

end