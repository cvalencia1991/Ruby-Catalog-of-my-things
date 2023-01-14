require_relative '../classes/label'
require_relative './book_module'
require 'colorize'

module LabelModule
  def list_all_labels
    if @labels.empty?
      puts "\nNo labels found in list 🚫 Add some items with labels . . . ".magenta
    else
      puts "\nAvailable labels in the list 🔖 ⭐ : #{@labels.count} \n".magenta
      @labels.each_with_index do |label, index|
        puts "[ #{index + 1} ]: Title: #{label.title} | Color: #{label.color}"
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
    input = nil
    while input.nil?
      print "\nPlease select a label by typing the corresponding number or "
      print "type 'back' to return to the previous menu: "
      input = gets.chomp
      if !valid_input?(input)
        print "\n🛑 ❌ Invalid input. Please try again \n".red
        input = nil
      elsif input == 'back'
        add_label
      end
    end
    @labels[input.to_i - 1]
  end

  def valid_input?(input)
    return true if input == 'back'

    (1..@genres.length).include?(input.to_i)
  end

  def add_label
    puts "\nSelect a label for this item or create a new one: "
    puts '[ 1 ] Select from existing labels'
    puts '[ 2 ] Create a new label'

    input = gets.chomp.to_i
    until [1, 2].include?(input)
      print "\n🛑 ❌ Invalid input, please enter 1 or 2 \n".red
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
