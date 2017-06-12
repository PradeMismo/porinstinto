class Tag < ActiveRecord::Base
  # RELATIONSHIPS
  has_many :entries, dependent: :destroy

  # VALIDATIONS
  validates_presence_of :name
end