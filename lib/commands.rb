Dir["./lib/commands/*.rb"].each {|file| require file }

module Commands
  COMMANDS = {
    C: Commands::C,
    F: Commands::F,
    H: Commands::H,
    I: Commands::I,
    L: Commands::L,
    S: Commands::S,
    V: Commands::V,
  }
end
