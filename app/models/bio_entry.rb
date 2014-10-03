class BioEntry < ActiveRecord::Base
  attr_accessible :title, :chapter_order, :content

  validates_presence_of :title, :chapter_order, :content

  default_scope order('chapter_order DESC')

  def tab_container
    return "tabs-" + (Entry.count + 2 - chapter_order).to_s
  end

end