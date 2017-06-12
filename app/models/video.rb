class Video < ActiveRecord::Base
  # RELATIONSHIPS
  belongs_to :video_category

  # VALIDATIONS
  validates_presence_of :title, :youtube_link

  # SCOPES
  default_scope  { order(:created_at => :desc) }
  
  # METHODS
  def youtube_id
    youtube_id = ""
    id_reached = false
    youtube_link.each_char do |current_char|
      if id_reached
        youtube_id += current_char 
      elsif current_char == "="
        id_reached = true
      end
    end
    return youtube_id
  end

  def thumbnail_url
    return "http://img.youtube.com/vi/" + youtube_id + "/mqdefault.jpg"
  end

  def youtube_embeed
    return "http://www.youtube.com/embed/" + youtube_id
  end
end