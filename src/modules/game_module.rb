# require 'json'
require_relative '../classes/game'
require_relative './authors_module'
require_relative './genre_module'
require_relative './label_module'
require_relative './valid_date'
require 'colorize'
require 'date'

module GameModule
  include GenreModule
  include AuthorModule
  include LabelModule

  def list_all_games
    if @games.empty?
      puts "No Games to Show 🚫 Please add some Games . . .\n".magenta
    else
      puts "\nAvailable Games in the list 🏓🎮 . . .\n".magenta
      @games.each_with_index do |game, index|
        print "#[#{index + 1}]: Name of Game: #{game.game_name} | Game Writer: #{game.author.first_name} #{game.author.last_name} |"
        print "Label: #{game.label.title} | Archived: #{game.archived} | Multiplayer: #{game.multiplayer} |"
        puts "Last played at: #{game.last_played_date} | Publish_date: #{game.publish_date} |  Genre: #{game.genre.name}"
      end
    end
  end

  def add_game
    print 'Enter the name of the game: '
    game_name = gets.chomp
    is_multiplayer = (get_user_input('Is is a multiplayer game (y/n): ', %w[y n]) == 'y')
    print 'Enter the last time you played the game e.g (2023-01-11):'
    last_played_at = set_valid_date
    print 'Enter the publish date of the game e.g (2023-01-11): '
    date = set_valid_date
    game = Game.new(game_name, date, is_multiplayer, last_played_at)

    archive_game(game)

    author = add_author
    author.add_item(game)
    puts "\nWriter added for game #{game.game_name} successfully 👤✅".green

    label = add_label
    label.add_item(game)
    puts "\nLabel added for game #{game.game_name} successfully 📘✅ ".green

    genre = add_genre
    genre.add_item(game)
    puts "\nGenre added for game #{game.game_name} successfully 🤹‍♂️✅ ".green
  end

  def get_user_input(prompt, valid_responses)
    while true
      print prompt
      input = gets.chomp
      break if valid_responses.include?(input)

      puts "\n🛑 ❌ Invalid input. Please enter one of the following: #{valid_responses.join(', ')} \n".red
    end
    input
  end

  def archive_game(game)
    
    current_date = Date.today
    last_played = current_date.year - game.last_played_date.year
    publish_year = current_date.year - game.publish_date.year
  
    if  last_played > 2 && publish_year > 10
      archived = (get_user_input('Do you want to archive this game? (y/n): ', %w[y n]) == 'y')
      game.archived = archived
      if archived
        if get_user_input('Do you want to confirm archiving this game (y/n): ', %w[y n]) == 'y'
          game.move_to_archive
          puts "\nGame archived and created successfully 📕✅ ".green
        else
          game.archived = false
          puts "\nGame not archived but created successfully 📕✅ ".green
        end
      else
        puts "\nGame created successfully 📕✅".green
      end
    elsif last_played < 2
      puts "\nThe game last played is less than 2 years. It cannot be archved. Game created successfully 📕✅".green
    elsif publish_year < 10
      puts "\nThe game is not older than 10 years. It cannot be archived. GAme created successfully 📕✅".green
    else
      puts "\n The game is not older than 10 years"
    end
    @games << game
  end

  # def save_games
  #   File.open('json_files/games.json', 'w') do |file|
  #     game = @games.each_with_index.map do |gam, _index|
  #       {
  #         publish_date: gam.publish_date, multiplayer: gam.multiplayer, last_played_date: gam.last_played_date
  #       }
  #     end
  #     file.write(JSON.generate(game))
  #   end
  # end

  # def read_game
  #   return [] unless File.exist?('json_files/games.json')
  #   return [] if File.open('json_files/games.json', &:size).zero?

  #   game_json = JSON.parse(File.read('json_files/games.json'))
  #   game_json.map do |game|
  #     Game.new(game['publish_date'], game['multiplayer'], game['last_played_date'])
  #   end
  # end
end
