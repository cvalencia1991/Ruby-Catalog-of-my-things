require 'date'
require 'colorize'
require_relative '../classes/genre'

module GenreModule

  def list_all_genres
    if @genres.empty?
      puts "No Genres to Show 🚫 Add some genres \n"
    else
      puts "Available Genres in the list 🤹‍♂️ \n"
      @genres.each_with_index do |genre, index|
        print "[#{index}]: Name: #{genre.name} \n"
      end
    end
  end

  def create_genre
    print 'Enter the name of the genre: '
    name = gets.chomp
    genre = Genre.new(name)
    @genres << genre
    return genre
  end

  def select_genre
    list_all_genres
      print "Please select a genre by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if input == 'back'
        get_genre
      else
        genre = @genres[input.to_i - 1]
      return genre
    end
  end
  
  def select_genre
    list_all_genres
    input = nil
    while input.nil?
      print "Please select a genre by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        puts "Invalid input. Please try again."
        input = nil
      elsif input == 'back'
        get_genre
      end
    end
    genre = @genres[input.to_i - 1]
    return genre
  end
  
  def valid_input?(input)
    return true if input == 'back'
    (0..@genres.length).include?(input.to_i)
  end

  def get_genre
    puts "Select a genre form the following list: "
    puts "[ 1 ] Select from existing genres"
    puts "[ 2 ] Add a new genre"

    input = gets.chomp.to_i
    while ![1, 2].include?(input)
      puts "Invalid input, please enter 1 or 2."
      input = gets.chomp.to_i
    end

    case input
    when 1
      return select_genre
    when 2
      return create_genre
    end
  end
end
