module Methodmusic
  def add_music_album
    puts 'name of the album: '
    album = gets.chomp.to_s
    puts 'Date of the album [yyyy-mm-dd]: '
    date = gets.chomp
    puts 'you want to archive [y-n] : '
    option = gets.chomp.to_s
    case option
    when 'y'
      archived = true
      @musicalbums.push(Item.new(album, date, archived))
    when n
      archived = false
      @musicalbums.push(Item.new(album, date, archived))
    else
      puts 'Invalid typing, please enter number again!'
    end
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
    puts 'Music Album and Genre created successfully 📚'
  end
end
