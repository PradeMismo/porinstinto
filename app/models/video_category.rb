class VideoCategory < ActiveRecord::Base
  attr_accessible :title

  has_many :videos, dependent: :destroy

  validates_presence_of :title

end
