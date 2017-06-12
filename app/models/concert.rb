class Concert < ActiveRecord::Base
  # VALIDATIONS
  validates_presence_of :date, :place, :concert_hall, :tickets 

  # SCOPES
  scope :next,     lambda{ |date = DateTime.now| where("date >  ? ", date) }
  scope :previous, lambda{ |date = DateTime.now| where("date <= ? ", date) }
  
  # METHODS
  def info
    results = ""
    if bands.present?
      results += "Con " + bands + ". "
    end
    if notes.present?
      results += notes.to_s + "."
    end
    return results
  end

  def location
    return concert_hall + ", " + place
  end
end