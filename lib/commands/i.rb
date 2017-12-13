require_relative 'base'

# I M N - Create a new M x N image with all pixels coloured white (O)
module Commands
  class I < Base
    def run
      validate_args

      Bitmap.new(*args[0, 2])
    end

    private

    def validate_args
      abort error_message('2 arguments required: M N')    unless args.count == 2
      abort error_message('Arguments should be integers') unless args.all? { |a| a.match(/\d/) }
    end
  end
end
