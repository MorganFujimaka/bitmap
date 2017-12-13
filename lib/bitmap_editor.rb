require 'pry'
require_relative 'bitmap'
require_relative 'command_parser'
require_relative 'commands'

class BitmapEditor
  def run(filename)
    return puts 'Please provide correct file' if filename.nil? || !File.exists?(filename)

    bitmap = Bitmap.read

    File.open(filename).each do |line|
      line = line.chomp

      next if !line || line.empty?

      command, *args = *CommandParser.parse(line)

      bitmap = Commands::COMMANDS.fetch(command.to_sym) { abort "Unrecognised command #{command}" }.run(bitmap, args)
    end

    Bitmap.write(bitmap)
  end
end
