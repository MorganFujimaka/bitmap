require 'pry'
require_relative 'bitmap'
require_relative 'bitmap_reader'
require_relative 'bitmap_writer'
require_relative 'command_parser'
require_relative 'commands'

class BitmapEditor
  def run(filename)
    raise ArgumentError, 'Please provide correct file' if filename.nil? || !File.exists?(filename)

    bitmap = Bitmap.new(BitmapReader.read)

    File.open(filename).each do |line|
      line = line.chomp

      next if !line || line.empty?

      command, *args = *CommandParser.parse(line)

      bitmap = Commands::COMMANDS.fetch(command.to_sym) { raise ArgumentError, "Unrecognised command #{command}" }.run(bitmap, args)
    end

    BitmapWriter.write(bitmap)
  end
end
