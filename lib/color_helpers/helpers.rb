module ColorHelpers
  module ActionViewExtension
    def random_hex_color
      "#"+SecureRandom.hex(3)
    end

    def hex_to_rgb(hex_color)
      color = hex_color.gsub('#','')
      "rgb("+color.scan(/../).map {|color| color.to_i(16)}.join(",").to_s+")"
    end

    def rgb_to_hex(rgb_color)
      color =  rgb_color.delete("rgb() ").split(",")
      "#%02x%02x%02x" % color
    end

    def darken_color(hex_color, amount=0.4)
      hex_color = hex_color.gsub('#','')
      rgb = hex_color.scan(/../).map(&:hex).map{|color| color * amount}.map(&:round)
      "#%02x%02x%02x" % rgb
    end

    def lighten_color(hex_color, amount=0.6)
      hex_color = hex_color.gsub('#','')
      rgb = hex_color.scan(/../).map(&:hex).map{|color| (color + 255) * amount}.map{|color| [color.round, 255].min}
      "#%02x%02x%02x" % rgb
    end

    def contrasting_text_color(hex_color, options = {})
      color = hex_color.gsub('#','')
      if options[:monochrome] == true
        convert_to_brightness_value(color) > 382.5 ? "#000000" : "#ffffff"
      else
        convert_to_brightness_value(color) > 382.5 ? darken_color(color) : lighten_color(color)
      end
    end

    def convert_to_brightness_value(hex_color)
       (hex_color.scan(/../).map {|color| color.hex}).sum
    end

    def color_to_grayscale(hex_color)
      hex_color = hex_color.gsub('#','')
      rgb = hex_color.scan(/../).map(&:hex)
      grayscale_factors = {r: 0.21, g: 0.72, b: 0.07}
      rgb[0] = (rgb[0].to_i * grayscale_factors[:r] + rgb[1].to_i * grayscale_factors[:g] + rgb[2].to_i * grayscale_factors[:b]).round
      rgb[1] = rgb[2] = rgb[0]
      "#%02x%02x%02x" % rgb
    end
  end
end
ActionView::Base.send :include, ColorHelpers::ActionViewExtension
