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
end
