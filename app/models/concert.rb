class Concert < ActiveRecord::Base
  # VALIDATIONS
  validates_presence_of :date, :place, :concert_hall, :tickets 

  # SCOPES
  scope :next,     lambda{ |date = DateTime.now| where("date >  ? ", date).order(:date => :asc ) }
  scope :previous, lambda{ |date = DateTime.now| where("date <= ? ", date).order(:date => :desc) }
  
  # METHODS
  def info
    results = ""
    results += "Con " + bands + ". " if bands.present?
    results += notes.to_s + "." if notes.present?
    return results
  end

  def location
    return concert_hall + ", " + place 
  end
end