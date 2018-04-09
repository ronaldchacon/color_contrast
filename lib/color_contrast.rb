require "color_contrast/version"

module ColorContrast
  extend self

  class InvalidColorError < StandardError; end

  def self.get_contrast(value)
    Contrast.new.perform(value)
  end

  class Contrast
    def perform(value)
      raise InvalidColorError, "Not a valid RGB value or HEX value" unless valid_rgb?(value) || valid_hex?(value)

      value = is_rgb?(value) ? value.delete(" ").split(",").map(&:to_i) : get_rgb(value)
      value = get_yiq(value)

      value >= 128 ? "dark" : "light"
    end

    private

    def get_rgb(hex)
      hex = hex.gsub(/[^0-9A-Z]/i, "")
      hex = hex.length == 3 ? short_to_long_hex(hex) : hex
      bigint = Integer(hex, 16)

      r = (bigint >> 16) & 255
      g = (bigint >> 8) & 255
      b = bigint & 255

      [r, g, b]
    end

    def get_yiq(rgb)
      r = rgb[0]
      g = rgb[1]
      b = rgb[2]

      ((r * 299) + (g * 587) + (b * 114)) / 1000
    end

    def short_to_long_hex(hex)
      hex.chars.map { |char| char * 2}.join
    end

    def valid_hex?(hex)
      hex && hex.match?(/\A(\h{3}|\h{6})\z/)
    end

    alias_method :is_hex?, :valid_hex?

    def valid_rgb?(rgb)
      rgb && rgb.match?(/\A([0-255]{1,3}),\s?([0-255]{1,3}),\s?([0-255]{1,3})\z/)
    end

    alias_method :is_rgb?, :valid_rgb?
  end
end
