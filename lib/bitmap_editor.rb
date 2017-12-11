require_relative 'bitmap'

class BitmapEditor
  def run(filename)
    return puts 'please provide correct file' if filename.nil? || !File.exists?(filename)

    File.open(filename).each do |line|
      line = line.chomp.strip
      case line
      when 'S'
        puts 'There is no image'
      else
        puts 'unrecognised command :('
      end
    end
  end

  private

  def bitmap
    @bitmap ||= ::Bitmap.read
  end
end
