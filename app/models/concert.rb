class Concert < ActiveRecord::Base
  validates_presence_of :date, :place, :concert_hall, :tickets 

  scope :previous, lambda{ |date = DateTime.now| where("date <= ? ", date) }
  scope :next,     lambda{ |date = DateTime.now| where("date > ? ", date) }


  def info
    results = ""
    if bands.present?
      results += "Con " + bands + ". "
    end
    if notes.present?
      results += notes.to_s + "."
    end
    return  results
  end

  def next_concert_description
    return date.strftime("%d/%m/%Y") + " " + place + ", " + concert_hall
  end
end