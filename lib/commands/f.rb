require_relative 'base'

# X Y C - Flood Fill
module Commands
  class F < Base
    def run
      validate_bitmap_presence
      validate_args

      bitmap.flood_fill(*args)

      bitmap
    end

    private

    def validate_args
      raise ArgumentError, error_message('3 arguments required: X Y C') unless args.count == 3
      raise ArgumentError, error_message('X and Y should be integers')  unless args[0..1].all? { |i| i.match(/\d/) }
      raise ArgumentError, error_message('Invalid color passed')        unless Colors.valid?(args[2])
    end
  end
end
