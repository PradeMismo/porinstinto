class Song < ActiveRecord::Base
  # RELATIONSHIPS
  belongs_to :record

  # VALIDATIONS
  validates_presence_of :name, :lyrics, :track_order, :record_id
  
  # SCOPES
  default_scope  { order(:track_order => :desc) }
end