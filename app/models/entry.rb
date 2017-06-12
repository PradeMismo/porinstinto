class Entry < ActiveRecord::Base
  # DECLARATIONS
  has_attached_file :photo, :styles => {:entry => "620x260#"}, dependent: :destroy
  
  # RELATIONSHIPS
  belongs_to :tag
  
  # VALIDATIONS
  validates_presence_of :title, :publish_date, :content, :tag_id
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
  
  # SCOPES
  default_scope  { order(:publish_date => :desc) }
  
  # METHODS
  def youtube_embeed
    youtube_id = ""
    id_reached = false
    youtube_link.each_char do |current_char|
      if id_reached
        youtube_id += current_char 
      elsif current_char == "="
        id_reached = true
      end
    end

    return "http://www.youtube.com/embed/" + youtube_id
  end
end
