require_relative 'base'

module Commands
  class L < Base
    def run
      validate_bitmap_presence
      validate_args

      bitmap.color_pixel(args[0].to_i, args[1].to_i, args[2])

      bitmap
    end

    private

    def validate_args
      abort error_message('3 arguments required: X Y C') unless args.count == 3
      abort error_message('X and Y should be integers')  unless args[0, 2].all? { |a| a.match(/\d/) }
      abort error_message('Invalid color passed')        unless Colors::VALID_COLORS.include?(args[2])
      abort error_message('X is out of image')           if args[0].to_i > bitmap.column_count
      abort error_message('Y is out of image')           if args[1].to_i > bitmap.row_count
    end

    def description
      'L X Y C - Colours the pixel (X,Y) with colour C'
    end
  end
end
