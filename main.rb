require_relative 'app'

class Main                                                                      
  puts "\nWelcome to the Cataloge App! ⭐ 📝 \n"
  app = App.new
  app.show_menu
end

Main.new
