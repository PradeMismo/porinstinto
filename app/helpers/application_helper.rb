module ApplicationHelper
  MONTHNAMES = [nil,"ENE","FEB","MAR","ABR","MAY","JUN","JUL","AGO","SEP","OCT","NOV","DIC"]

  def calendar_tag(date)
    day    = content_tag(:h3, date.day)
    month  = content_tag(:h5, MONTHNAMES[date.month])
    year   = content_tag(:h6, date.year)

    header = content_tag(:div, year, class: "panel-header")
    body   = content_tag(:div, day, class: "panel-body")
    footer = content_tag(:div, month, class: "panel-footer")

    content = safe_join([header,body,footer])
    content_tag(:div, content, class: "panel text-center")
  end

  def concert_tag(concert)
    tickets   = concert.ticket_link.present? ? link_to(fa_icon("ticket", text: concert.tickets),concert.ticket_link) : fa_icon("ticket", text: concert.tickets)
    hour      = fa_icon("clock-o", text: concert.date.strftime("%H:%M"))
    
    info      = concert.event_link.present? ? link_to(content_tag(:h5, concert.info),concert.event_link) : content_tag(:h5, concert.info)
    details   = content_tag(:h6, hour + " " + tickets)
    separator = content_tag(:hr)
    location  = content_tag(:h4, concert.location)

    content = safe_join([location,separator,info,details])
    content_tag(:div, content, class: "concert-desc")
  end
end