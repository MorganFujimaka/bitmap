module Commands
  class Base
    def initialize(bitmap)
      raise ArgumentError, 'Bitmap file required' unless bitmap
    end

    def description
      raise NotImplementedError
    end
  end
end
