require_relative 'base'

module Commands
  class C < Base
    def run
      validate_bitmap_presence

      bitmap.pixels.map! do |row|
        row.map! { Colors::WHITE }
      end

      bitmap
    end

    private

    def description
      'C - Clears the table, setting all pixels to white (O)'
    end
  end
end
