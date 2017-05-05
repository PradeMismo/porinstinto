module CarouselHelper
  def carousel_for(input_slides)
    Carousel.new(self, input_slides).html
  end

  class Carousel
    def initialize(view, input_slides)
      @view, @input_slides = view, input_slides
      @uid = SecureRandom.hex(6)
    end

    def html
      content = safe_join([indicators, slides, controls])
      content_tag(:div, content, id: uid, class: 'carousel slide')
    end

    private

    attr_accessor :view, :input_slides, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = input_slides.count.times.map { |index| indicator_tag(index) }
      content_tag(:ol, safe_join(items), class: 'carousel-indicators')
    end

    def indicator_tag(index)
      options = {
        class: (index.zero? ? 'active' : ''),
        data: { 
          target: uid, 
          slide_to: index 
        }
      }

      content_tag(:li, '', options)
    end

    def slides
      items = input_slides.map.with_index { |input_slide, index| slide_tag(input_slide, index.zero?) }
      content_tag(:div, safe_join(items), class: 'carousel-inner')
    end

    def slide_tag(input_slide, is_active)
      options = {
        class: (is_active ? 'item active' : 'item'),
      }

      content_tag(:div, image_tag(input_slide.photo.url(:slide)), options)
    end

    def controls
      safe_join([control_tag('left'), control_tag('right')])
    end

    def control_tag(direction)
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == 'left' ? 'prev' : 'next' }
      }

      icon = content_tag(:i, '', class: "fa fa-chevron-#{direction}")
      control = link_to(icon, "##{uid}", options)
    end
  end
end