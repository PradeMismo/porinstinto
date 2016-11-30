class Record < ActiveRecord::Base
  has_many :songs, dependent: :destroy
  has_attached_file :photo, :styles => {:cover => "260x260>", :gallery => "300x300>"}, dependent: :destroy

  validates_presence_of :name, :publish_date, :description
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  default_scope  { order(:publish_date => :desc) }
  scope :studio,      -> { where(own: true)  }
  scope :compilation, -> { where(own: false) }

  def get_spotify_url
    spotify_id = spotify_link[-22..-1]
    return "https://embed.spotify.com/?uri=spotify:album:" + spotify_id
  end
end