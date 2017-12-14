require 'base64'

module BitmapReader
  extend self

  def read
    return unless File.exists?(filename)

    File.open(filename, 'r') { |f| Marshal.load(Base64.decode64(f.read)) }
  end

  private

  def filename
    'bitmap'
  end
end
