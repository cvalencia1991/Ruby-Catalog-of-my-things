require_relative './genremethod'
module Methodmusic
  include Genremethod
  def add_music_album
    print 'Name of the album: '
    album = gets.chomp.to_s
    print 'Date of the album [yyyy-mm-dd]: '
    date = gets.chomp
    print 'you want to archive [y-n] : '
    option = gets.chomp.to_s
    case option
    when 'y'
      archived = true
      @musicalbums.push(MusicAlbum.new(archived, album, date))
    when 'n'
      archived = false
      @musicalbums.push(MusicAlbum.new(archived, album, date))
    else
      puts 'Invalid typing, please enter number again!'
    end
    puts 'Music Album created successfully 📚'
    genremethod
  end

  def list_all_music_albums
    puts "No Album  Date"
    @musicalbums.each_with_index do |alb, idx|
      print "#{idx})  Album: #{alb.album_name} Date:#{alb.publish_date} "
    end
  end
end
