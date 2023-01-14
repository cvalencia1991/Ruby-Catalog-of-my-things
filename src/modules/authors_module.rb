require_relative '../classes/author'
require 'colorize'
require 'date'

module AuthorModule
  def list_all_authors
    if @authors.empty?
      puts "\nNo Authors to Show 🚫 Add some authors . . .".magenta
    else
      puts "\nAvailable Authors in the list 👤 📝 : #{@authors.count} \n".magenta
      @authors.each_with_index do |author, index|
        print "[ #{index + 1} ]: First Name: #{author.first_name} | Last Name: #{author.last_name} \n"
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
      print "\nPlease select an author by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        print "\n🛑 ❌ Invalid input. Please try again \n".red
        input = nil
      elsif input == 'back'
        add_author
      end
    end
    @authors[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@genres.length).include?(input.to_i)
  end

  def add_author
    puts "\nSelect an author for this item or create a new one: "
    puts '[ 1 ] Select from existing authors'
    puts '[ 2 ] Add a new author'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      print "\n🛑 ❌ Invalid input, please enter 1 or 2 \n".red
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
