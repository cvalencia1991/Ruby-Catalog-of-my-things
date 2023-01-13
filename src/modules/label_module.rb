require 'colorize'
require_relative '../classes/label'
require_relative './book_module'

module LabelModule
  def list_all_labels
    if @labels.empty?
      puts "No labels found in list 🚫 Add some items with labels \n"
    else
      puts "Available items with labels in the list 🔖 \n"
      @labels.each_with_index do |label, index|
        puts "[#{index + 1}]: Title: #{label.title} | Color: #{label.color}"
      end
    end
  end

  def create_label
    print 'Enter the title of label: '
    title = gets.chomp
    print 'Enter the color of the label: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    label
  end

  def select_label
    list_all_labels
    print 'Please select a label by typing the corresponding number or '
    print "type 'back' to return to the previous menu: \n"
    input = gets.chomp
    if input == 'back'
      get_book_label
    else
      @labels[input.to_i - 1]

    end
  end

  def select_label
    list_all_labels
    input = nil
    while input.nil?
      print 'Please select a genre by typing the corresponding number or '
      print "type 'back' to return to the previous menu: \n"
      input = gets.chomp
      if !valid_input?(input)
        puts "Invalid input. Please try again \n"
        input = nil
      elsif input == 'back'
        get_book_label
      end
    end
    @labels[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@genres.length).include?(input.to_i)
  end

  def get_book_label
    puts 'Select a label for this book or create a new one: '
    puts '[ 1 ] Select from existing labels'
    puts '[ 2 ] Create a new label'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      puts "Invalid input, please enter 1 or 2 \n"
      input = gets.chomp.to_i
    end

    case input
    when 1
      select_label
    when 2
      create_label
    end
  end
end
