class VideoCategory < ActiveRecord::Base
  # DECLARATIONS
  extend FriendlyId
  friendly_id :title, use: :slugged

  # RELATIONSHIPS
  has_many :videos, dependent: :destroy

  # VALIDATIONS
  validates_presence_of :title
end