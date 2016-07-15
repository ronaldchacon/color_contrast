require "color_contrast/version"

module ColorContrast
  extend self

  def get_contrast(hex)
    rgb = get_rgb(hex)
    yiq = get_yiq(rgb)

    if yiq >= 128
      "dark"
    else
      "light"
    end
  end

  private

  def get_rgb(hex)
    hex = hex.gsub(/[^0-9A-Z]/i, "")
    bigint = Integer(hex, 16)

    r = (bigint >> 16) & 255
    g = (bigint >> 8) & 255
    b = bigint & 255

    rgb = [r, g, b]
    rgb
  end

  def get_yiq(rgb)
    r = rgb[0]
    g = rgb[1]
    b = rgb[2]

    yiq = ((r * 299) + (g * 587) + (b * 114)) / 1000
    yiq
  end
end
