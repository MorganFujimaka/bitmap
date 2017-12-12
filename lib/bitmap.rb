require_relative 'colors'

class Bitmap
  MAX_COLUMN_COUNT = 250
  MAX_ROW_COUNT    = 250

  FILENAME = 'bitmap'.freeze

  attr_reader :pixels

  def self.write(bitmap)
    File.open(FILENAME, 'w') { |f| f.write(Marshal.dump(self)) }
  end

  def self.read
    return unless File.exists?(FILENAME)

    File.open(FILENAME, 'r') { |f| Marshal.load(f.read) }
  end

  def initialize(c_count, r_count, color = Colors::WHITE)
    if c_count > MAX_COLUMN_COUNT || r_count > MAX_ROW_COUNT
      abort "Maximum allowed size is #{MAX_COLUMN_COUNT} x #{MAX_ROW_COUNT}"
    end

    @pixels = Array.new(r_count) { Array.new(c_count) { color } }
  end

  def column_count
    pixels.first.count
  end

  def row_count
    pixels.count
  end

  def color_pixel(x, y, color)
    pixels[y - 1][x - 1] = color
  end
end
