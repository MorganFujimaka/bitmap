require 'pry'

module Commands
  class Base
    attr_reader :bitmap, :args

    def self.run(bitmap, args)
      new(bitmap, args).run
    end

    def initialize(bitmap, args)
      @bitmap = bitmap
      @args   = args
    end

    def run
      raise NotImplementedError
    end

    private

    def validate_bitmap_presence
      raise ArgumentError, error_message('Bitmap required') unless bitmap
    end

    def error_message(message)
      "#{self.class}: #{message}"
    end

    def description
      raise NotImplementedError
    end
  end
end
