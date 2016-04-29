require 'spec_helper'

describe ColorHelpers do
  test_hex_color = "#"+SecureRandom.hex(3)
  test_rgb_color = "rgb(#{rand(255)}, #{rand(255)}, #{rand(255)})"
  hex_white = "#ffffff"
  hex_black = "#000000"
  hex_color_regex = "^#(?:[0-9a-fA-F]{3}){1,2}$"
  rgb_color_regex = /^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/

  include ColorHelpers::ActionViewExtension
  it 'has a version number' do
    expect(ColorHelpers::VERSION).not_to be nil
  end

  describe 'random_hex_color' do
    it 'is a valid hex color string' do
      expect(random_hex_color).to match(hex_color_regex)
    end
    it 'is randomly generated' do
      expect(random_hex_color).not_to eq random_hex_color
    end
  end

  describe 'convert_to_brightness_value' do
    it 'is a value between 0 and 510' do
      expect(convert_to_brightness_value(test_hex_color)).to be_between(0, 510).inclusive
    end
  end

  describe "darken_color" do
    it 'is a valid hex color string' do
      expect(darken_color(test_hex_color)).to match(hex_color_regex)
    end
  end

  describe 'lighten_color' do
    it 'is a valid hex color string' do
      expect(lighten_color(test_hex_color)).to match(hex_color_regex)
    end
  end

  describe 'contrasting_text_color' do
    it 'is a valid hex color string' do
      expect(contrasting_text_color(test_hex_color)).to match(hex_color_regex)
    end
    it 'changes color' do
      color = test_hex_color
      expect(contrasting_text_color(color)). to_not eq color
    end
    it 'converts to contrasting monochrome color' do
      expect(contrasting_text_color(hex_white, monochrome: true)).to eq(hex_black)
      expect(contrasting_text_color(hex_black, monochrome: true)).to eq(hex_white)
    end
  end

  describe 'hex_to_rgb' do
    it 'is a valid rgb color string' do
      expect(hex_to_rgb(test_hex_color)).to match(rgb_color_regex)
    end
  end

  describe 'rgb_to_hex' do
    it 'is a valid hex color string' do
      expect(rgb_to_hex(test_rgb_color)).to match(hex_color_regex)
    end
  end

  describe 'color_to_grayscale' do
    it 'is a valid hex color string' do
      expect(color_to_grayscale(test_hex_color)).to match(hex_color_regex)
    end
    it 'is a greyscale color' do
      color_array = color_to_grayscale(test_hex_color).gsub('#','').scan(/../)
      expect(color_array[0]).to eq color_array[1]
      expect(color_array[1]).to eq color_array[2]
    end
  end
end
