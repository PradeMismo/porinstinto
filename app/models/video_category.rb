class VideoCategory < ActiveRecord::Base
  # RELATIONSHIPS
  has_many :videos, dependent: :destroy

  # VALIDATIONS
  validates_presence_of :title
end