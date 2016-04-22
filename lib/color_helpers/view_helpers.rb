module ColorHelpers
  module ViewHelpers
    def darken_color(hex_color, amount=0.4)
      hex_color = hex_color.gsub('#','')
      rgb = hex_color.scan(/../).map(&:hex).map{|color| color * amount}.map(&:round)
      "#%02x%02x%02x" % rgb
    end

    def lighten_color(hex_color, amount=0.6)
      hex_color = hex_color.gsub('#','')
      rgb = hex_color.scan(/../).map(&:hex).map{|color| (color + 255) * amount}.map(&:round)
      "#%02x%02x%02x" % rgb
    end

    def contrasting_text_color(hex_color)
      color = hex_color.gsub('#','')
      convert_to_brightness_value(color) > 382.5 ? darken_color(color) : lighten_color(color)
    end

    def convert_to_brightness_value(hex_color)
       (hex_color.scan(/../).map {|color| color.hex}).sum
    end
  end
end
