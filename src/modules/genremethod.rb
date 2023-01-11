module Genremethod
  def genremethod
    puts 'name of the genre that are you going to add: '
    name = gets.chomp.to_s
    @genre.push(Genre.new(name))
    puts 'do you want to add in spotify [Y-N] : '
    condition = gets.chomp.downcase.to_s
    case condition
    when 'y'
      on_spotify = true
      @genre.push(MusicAlbum.new(on_spotify, date))
    when 'n'
      on_spotify = false
      @genre.push(MusicAlbum.new(on_spotify, date))
    else
      puts 'Invalid typing, please enter number again!'
    end
  end

  def list_all_genres
    @genre.each { |info| print info }
  end
end
