require 'date'
require 'colorize'
require_relative '../classes/author'

module AuthorModule
  def list_all_authors
    if @authors.empty?
      puts "No Authors to Show 🚫 Add some authors \n"
    else
      puts "Available Authors in the list 👥✍ \n"
      @authors.each_with_index do |author, index|
        print "[#{index + 1}]: First Name: #{author.first_name} | Last Name: #{author.last_name} \n"
      end
    end
  end

  def create_author
    print 'Enter the first name of the author: '
    first_name = gets.chomp
    print 'Enter the second name of the author: '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end

  def select_author
    list_all_authors
    input = nil
    while input.nil?
      print 'Please select a genre by typing the corresponding number or '
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        puts 'Invalid input. Please try again.'
        input = nil
      elsif input == 'back'
        get_author
      end
    end
    @authors[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@genres.length).include?(input.to_i)
  end

  def get_author
    puts 'Select an author form the following list: '
    puts '[ 1 ] Select from existing authors'
    puts '[ 2 ] Add a new author'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      puts "Invalid input, please enter 1 or 2 \n"
      input = gets.chomp.to_i
    end

    case input
    when 1
      select_author
    when 2
      create_author
    end
  end
end
