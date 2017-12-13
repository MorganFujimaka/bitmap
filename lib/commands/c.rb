require_relative 'base'

# C - Clears the table, setting all pixels to white (O)
module Commands
  class C < Base
    def run
      validate_bitmap_presence

      bitmap.pixels.map! do |row|
        row.map! { Colors::WHITE }
      end

      bitmap
    end
  end
end
