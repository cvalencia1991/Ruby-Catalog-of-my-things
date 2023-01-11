require_relative '../classes/genre'
module Genremethod
  def genremethod
    print 'name of the genre that are you going to add: '
    name = gets.chomp.to_s
    @genre.push(Genre.new(name))
    puts 'Genre created successfully 📚'
  end

  def list_all_genres
    @genre.each_with_index { |info, idx| print "#{idx}) #{info.name}" }
  end
end
