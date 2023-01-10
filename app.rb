class App
  def show_menu
    puts "\nPlease choose an option by entering a number from below 👇: \n\n"
    puts "[ 1 ] - List all books"
    puts "[ 2 ] - List all music albums"
    puts "[ 3 ] - List of games"
    puts "[ 4 ] - List all genres (e.g 'Comedy', 'Thriller')"
    puts "[ 5 ] - List all labels (e.g. 'Gift', 'New')"
    puts "[ 6 ] - List all authors (e.g. 'Stephen King')"
    puts "[ 7 ] - Add a book"
    puts "[ 8 ] - Add a music album"
    puts "[ 9 ] - Add a game"
    puts "[ 0 ] - Exit \n\n"
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
    puts "\n 🛑 ❌ ❌ Invalid option. Please select a valid input..."
    show_menu
  end

  def list_items(user_choice)
    case user_choice
    when 1 then # list_all_books
    when 2 then # list_all_music_albums
    when 3 then # list_all_games
    when 4 then # list_all_genres
    when 5 then # list_all_labels
    when 6 then # list_authors
    end
    show_menu
  end

  def add_items(user_choice)
    case user_choice
    when 7 then # create_book
    when 8 then # add_music_album
    when 9 then # add_game
    end
    show_menu
  end

  def exit
    puts "Thank you for using the app, see you later!👋  \n\n"
  end
end
