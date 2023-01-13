require 'json'
require_relative '../classes/game'
require 'date'

module GameModule
  def add_game
    puts 'Enter the published date:'
    publish_date = gets.chomp
    puts 'Does it have Multiplayer (y/n)'
    is_multiplayer = gets.chomp
    is_multiplayer = is_multiplayer == 'y'
    puts 'Enter the last time you played the game date:'
    last_played_at = gets.chomp
    @games.push(Game.new(publish_date, is_multiplayer, last_played_at))
    save_games
  end

  def save_games
    File.open('json_files/games.json', 'w') do |file|
      game = @games.each_with_index.map do |gam, _index|
        {
          publish_date: gam.publish_date, multiplayer: gam.multiplayer, last_played_date: gam.last_played_date
        }
      end
      file.write(JSON.generate(game))
    end
  end

  def read_game
    return [] unless File.exist?('json_files/games.json')
    return [] if File.open('json_files/games.json', &:size).zero?

    game_json = JSON.parse(File.read('json_files/games.json'))
    game_json.map do |game|
      Game.new(game['publish_date'], game['multiplayer'], game['last_played_date'])
    end
  end

  def list_all_games
    @games.each do |game|
      puts "Publish date: #{game.publish_date}"
      puts "Multiplayer: #{game.multiplayer}"
      puts "Last played at: #{game.last_played_date}"
      puts "Archived: #{game.archived}"
      puts ''
    end
  end
end
