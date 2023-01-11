module Methodmusic
  def add_music_album
    puts 'name of the album: '
    album = gets.chomp.to_s
    puts 'you want to archive [y-n] : '
    option = gets.chomp.to_s
    case option
    when 'y'
      archived = true
      @musicalbum.push(Item.new(album, Date.strptime(date, '%m/%d/%Y'), archived))
    when n
      archived = false
      @musicalbum.push(Item.new(album, Date.strptime(date, '%m/%d/%Y'), archived))
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
      @musicalbum.push(MusicAlbum.new(on_spotify))
    when 'n'
      on_spotify = false
      @musicalbum.push(MusicAlbum.new(on_spotify))
    else
      puts 'Invalid typing, please enter number again!'
    end
    puts 'Music Album created successfully 📚'
  end
end
