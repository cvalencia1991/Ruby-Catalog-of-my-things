# require_relative 'app'

class Interface
  @welcome = 'Welcome to the Cataloge App!', ''
  def interface; end
end

# class Main
#   def initialize
#     @app = App.new
#     @interface = Interface.new
#   end

#   def select
#     option = gets.chomp.to_i
#     case option
#     when 1..6
#       @app.select(option)
#       run
#     when 7
#       @app.save_data
#       puts 'Thank you for using this App!'
#     else
#       puts 'Incorrect Input: Option does not exist'
#       run
#     end
#   end

#   def start
#     @app.load_data
#     run
#   end

#   def run
#     @interface.interface
#     select
#   end

#   private :select
# end

# Main.new.start
