require 'matrix'
require_relative 'colors'

class Bitmap
  MAX_ROW_COUNT    = 250
  MAX_COLUMN_COUNT = 250

  FILENAME = 'bitmap'.freeze

  attr_reader :row_count, :column_count, :pixels

  def initialize(row_count, column_count, color = ::Colors::O)
    if row_count > MAX_ROW_COUNT || column_count > MAX_COLUMN_COUNT
      raise ArgumentError, 'Maximum allowed size is 200 x 200'
    end

    @row_count    = row_count
    @column_count = column_count
    @pixels       = Matrix.build(row_count, column_count) { color }
  end

  def write
    File.open(FILENAME, 'w') do |file|
      file.write Marshal.dump(self)
    end
  end

  def read
    return unless File.exists?(FILENAME)

    File.open(FILENAME, 'r') do |file|
      Marshal.load(file.read)
    end
  end
end
