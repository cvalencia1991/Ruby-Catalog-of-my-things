require 'colorize'

class App
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
    when 1 # list_all_books
    when 2 # list_all_music_albums
    when 3 # list_all_games
    when 4 # list_all_genres
    when 5 # list_all_labels
    when 6 # list_authors
    end
    show_menu
  end

  def add_items(user_choice)
    case user_choice
    when 7 # create_book
    when 8 # add_music_album
    when 9 # add_game
    end
    show_menu
  end

  def exit
    puts "Thank you for using the app, see you later!👋  \n\n".blue
  end
end
