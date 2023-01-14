require_relative '../classes/genre'
require 'colorize'
require 'date'

module GenreModule
  def list_all_genres
    if @genres.empty?
      puts "\nNo Genres to Show 🚫 Add some genres . . . ".magenta
    else
      puts "\nAvailable Genres in the list 🔸🔷 : #{@genres.count} \n".magenta
      @genres.each_with_index do |genre, index|
        print "[ #{index + 1} ]: Name: #{genre.name} \n"
      end
    end
  end

  def create_genre
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    genre
  end

  def select_genre
    list_all_genres
    input = nil
    while input.nil?
      print "\nPlease select a genre by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        print "\n🛑 ❌ Invalid input. Please try again \n".red
        input = nil
      elsif input == 'back'
        add_genre
      end
    end
    @genres[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@genres.length).include?(input.to_i)
  end

  def add_genre
    puts "\nSelect a genre for this item or create a new one: "
    puts '[ 1 ] Select from existing genres'
    puts '[ 2 ] Add a new genre'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      print "\n🛑 ❌ Invalid input, please enter 1 or 2 \n".red
      input = gets.chomp.to_i
    end

    case input
    when 1
      select_genre
    when 2
      create_genre
    end
  end
end
