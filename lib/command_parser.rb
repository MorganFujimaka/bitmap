module CommandParser
  extend self

  def parse(line)
    line.strip.split(' ')
  end
end
