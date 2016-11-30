class BioEntry < ActiveRecord::Base
  validates_presence_of :title, :chapter_order, :content

  default_scope  { order(:chapter_order => :desc) }

  def tab_container
    return "tabs-" + (Entry.count + 2 - chapter_order).to_s
  end
end