require 'base64'
require_relative 'colors'

class Bitmap
  MAX_COLUMN_COUNT = 250
  MAX_ROW_COUNT    = 250

  attr_reader :pixels

  def self.[](c_count, r_count, color = Colors::WHITE)
    c_count, r_count = c_count.to_i, r_count.to_i

    if c_count > MAX_COLUMN_COUNT || r_count > MAX_ROW_COUNT
      raise ArgumentError, "Maximum allowed size is #{MAX_COLUMN_COUNT} x #{MAX_ROW_COUNT}"
    end

    pixels = Array.new(r_count) { Array.new(c_count) { color } }

    new(pixels)
  end

  def initialize(pixels)
    @pixels = pixels
  end

  def color_pixel(x, y, color)
    x, y = x.to_i, y.to_i

    raise ArgumentError, 'X is out of image' unless (1..column_count).include?(x)
    raise ArgumentError, 'Y is out of image' unless (1..row_count).include?(y)

    pixels[y - 1][x - 1] = color
  end

  def color_vertical(x, y1, y2, color)
    x, y1, y2 = x.to_i, y1.to_i, y2.to_i

    raise ArgumentError, 'X is out of image'       unless (1..column_count).include?(x)
    raise ArgumentError, 'Y1 must be less than Y2' unless y1 < y2
    raise ArgumentError, 'Y1 is out of image'      unless (1..row_count).include?(y1)
    raise ArgumentError, 'Y2 is out of image'      unless (1..row_count).include?(y2)

    pixels[(y1 - 1)..(y2 - 1)].each do |row|
      row[x - 1] = color
    end
  end

  def color_horizontal(x1, x2, y, color)
    x1, x2, y = x1.to_i, x2.to_i, y.to_i

    raise ArgumentError, 'X1 must be less than X2' unless x1 < x2
    raise ArgumentError, 'X1 is out of image'      unless (1..column_count).include?(x1)
    raise ArgumentError, 'X2 is out of image'      unless (1..column_count).include?(x2)
    raise ArgumentError, 'Y is out of image'       unless (1..row_count).include?(y)

    (x1..x2).each do |i|
      pixels[y - 1][i - 1] = color
    end
  end

  def inspect
    pixels.each do |row|
      puts row.join(' ')
    end
  end

  private

  def column_count
    pixels.first.count
  end

  def row_count
    pixels.count
  end
end
