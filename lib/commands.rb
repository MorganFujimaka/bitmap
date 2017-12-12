require_relative 'commands/c'
require_relative 'commands/h'
require_relative 'commands/i'
require_relative 'commands/l'
require_relative 'commands/s'
require_relative 'commands/v'

module Commands
  COMMANDS = {
    C: Commands::C,
    H: Commands::H,
    I: Commands::I,
    L: Commands::L,
    S: Commands::S,
    V: Commands::V,
  }
end
