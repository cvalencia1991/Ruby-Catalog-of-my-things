require_relative 'genremethod'
module Methodmusic
  include Genremethod
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
    when 'n'
      archived = false
      @musicalbums.push(Item.new(album, date, archived))
    else
      puts 'Invalid typing, please enter number again!'
    end
    puts 'Music Album and Genre created successfully 📚'
    genremethod
  end
end
