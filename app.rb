require_relative './src/modules/game_module'
require_relative './src/modules/book_module'
require_relative './src/modules/genre_module'
require_relative './src/modules/label_module'
require_relative './src/modules/music_module'
require_relative './src/classes/musicalbum'
require_relative './src/classes/items'
require_relative './src/classes/genre'
require_relative './src/storage'
require 'colorize'
require 'json'

class App
  include BookModule
  include LabelModule
  include GenreModule
  include MusicModule
  include GameModule
  include AuthorModule

  def initialize
    @games = []
    @albums = []
    @labels = []
    @books = []
    @authors = []
    @genres = []
    load_data
  end

  def load_data
    @labels = Storage.load_data('labels')
    @books = Storage.load_data('books')
    @genres = Storage.load_data('genres')
    @albums = Storage.load_data('music_albums')
    @authors = Storage.load_data('authors')
    @games = Storage.load_data('games')
  end

  def show_menu
    puts "\nPlease choose an option by entering a number from below 👇: \n\n".yellow.underline
    puts '[ 1 ] - List all books'.cyan
    puts '[ 2 ] - List all music albums'.cyan
    puts '[ 3 ] - List of games'.cyan
    puts "[ 4 ] - List all genres (e.g 'Comedy', 'Thriller')".cyan
    puts "[ 5 ] - List all labels (e.g. 'Gift', 'New')".cyan
    puts "[ 6 ] - List all authors (e.g. 'Stephen King')".cyan
    puts '[ 7 ] - Add a book'.cyan
    puts '[ 8 ] - Add a music album'.cyan
    puts '[ 9 ] - Add a game'.cyan
    puts "[ 0 ] - Exit \n\n".cyan
    user_choice = gets.chomp.to_i
    select_option(user_choice)
  end

  # @create_games = create_game

  def select_option(user_choice)
    case user_choice
    when 1..6
      list_items(user_choice)
    when 7..9
      add_items(user_choice)
    when 0
      exit
    else
      invalid_option
    end
  end

  def invalid_option
    puts "\n 🛑 ❌ ❌ Invalid option. Please select a valid input...".red.underline
    show_menu
  end

  def list_items(user_choice)
    case user_choice
    when 1 then list_all_books
    when 2 then list_all_music_albums
    when 3 then list_all_games
    when 4 then list_all_genres
    when 5 then list_all_labels
    when 6 then list_all_authors

    end
    show_menu
  end

  def add_items(user_choice)
    case user_choice
    when 7 then create_book
    when 8 then add_music_album
    when 9 then add_game
    end
    show_menu
  end

  def exit
    puts "Thank you for using the app, see you later!👋  \n\n".blue
    Storage.save_data('books', @books)
    Storage.save_data('labels', @labels)
    Storage.save_data('genres', @genres)
    Storage.save_data('music_albums', @albums)
    Storage.save_data('games', @games)
    Storage.save_data('authors', @authors)
  end
end
