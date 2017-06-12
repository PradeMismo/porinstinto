class BioEntry < ActiveRecord::Base
  # VALIDATIONS
  validates_presence_of :title, :chapter_order, :content

  # SCOPES
  default_scope  { order(:chapter_order => :desc) }
  
  # METHODS
  def tab_container
    return "tabs-" + (Entry.count + 2 - chapter_order).to_s
  end
end