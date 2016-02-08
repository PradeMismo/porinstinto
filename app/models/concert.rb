class Concert < ActiveRecord::Base
  attr_accessible :date, :place, :concert_hall, :tickets, :bands, :notes, :event_link, :ticket_link

  validates_presence_of :date, :place, :concert_hall, :tickets 

  scope :previous, lambda { where("date <= ? ", DateTime.now) }
  scope :next, lambda { where("date > ? ", DateTime.now) }

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