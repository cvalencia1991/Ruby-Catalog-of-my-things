require_relative '../classes/genre'
require 'json'
module Genremethod
  def genremethod
    print 'name of the genre that are you going to add: '
    name = gets.chomp.to_s
    @genre.push(Genre.new(name))
    save_genre
    puts 'Genre created successfully 📚'
  end

  def save_genre
    File.open('genre.json', 'w') do |file|
      genre = @genre.each_with_index.map do |gen, index|
        {
          genre: gen.name, id: gen.id, index: index
        }
      end
      file.write(JSON.generate(genre))
    end
  end

  def read_genre
    return [] unless File.exist?('genre.json')

    genre_json = JSON.parse(File.read('genre.json'))
    genre_json.map do |_gen|
      Genre.new(genre['genre'], genre['id'])
    end
  end

  def list_all_genres
    @genre.each_with_index { |info, idx| print "#{idx}) #{info.name}" }
  end
end
