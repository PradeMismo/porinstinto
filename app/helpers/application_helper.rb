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
    info      = content_tag(:h5, concert.info)
    separator = content_tag(:hr)
    location  = content_tag(:h4, concert.location)

    content = safe_join([info,separator,location])
    content_tag(:div, content, class: "concert-desc")
  end
end
