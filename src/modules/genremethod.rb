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
    File.open('src/database/genre.json', 'w') do |file|
      genre = @genre.each_with_index.map do |gen, _index|
        {
          genre: gen.name, id: gen.id
        }
      end
      file.write(JSON.generate(genre))
    end
  end

  def read_genre
    return [] unless File.exist?('src/database/genre.json')

    genre_json = JSON.parse(File.read('src/database/genre.json'))
    genre_json.map do |genre|
      Genre.new(genre['genre'])
    end
  end

  def list_all_genres
    @genre.each { |info, _idx| puts info.name.to_s }
  end
end
