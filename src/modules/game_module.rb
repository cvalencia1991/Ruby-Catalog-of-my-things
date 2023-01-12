require 'json'
require_relative '../classes/game'
require 'date'

def load_games
  data = []
  file = './json_files/games.json'
  if File.exist?(file)
    JSON.parse(File.read(file)).each do |game|
      publish_date = game['publish_date']
      last_played_at = game['last_played_date']
      data.push(Game.new(publish_date, game['multiplayer'], last_played_at, archived: game['archived']))
    end
  else
    File.write('./json_files/games.json', [])
  end

  data
end

def create_game
  data = []
  @games.each do |game|
    data.push(game.publish_date, game.multiplayer, game.last_played_date, archived: game.archived)
  end
  File.write('./json_files/games.json', JSON.generate(data))
end
