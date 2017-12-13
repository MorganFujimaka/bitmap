require_relative 'base'

# V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive)
module Commands
  class V < Base
    def run
      validate_bitmap_presence
      validate_args

      bitmap.color_vertical(*args)

      bitmap
    end

    private

    def validate_args
      abort error_message('4 arguments required: X1 X2 Y C') unless args.count == 4
      abort error_message('X, Y1 and Y2 should be integers') unless args[0..2].all? { |i| i.match(/\d/) }
      abort error_message('Invalid color passed')            unless Colors.valid?(args[3])
    end
  end
end
