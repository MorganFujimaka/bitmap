require_relative 'base'

# S - Show the contents of the current image
module Commands
  class S < Base
    def run
      validate_bitmap_presence

      bitmap.inspect

      bitmap
    end
  end
end
