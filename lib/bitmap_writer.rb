require 'base64'

module BitmapWriter
  extend self

  def write(bitmap)
    File.open(filename, 'w') { |f| f.write Base64.encode64(Marshal.dump(bitmap.pixels)) }
  end

  private

  def filename
    'bitmap'
  end
end
