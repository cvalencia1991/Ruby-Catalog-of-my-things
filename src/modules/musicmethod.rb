require_relative './genremethod'
require 'json'

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
    save_album
    puts 'Music Album created successfully 📚'
    genremethod
  end

  def save_album
    File.open('src/database/musicalbum.json', 'w') do |file|
      album = @musicalbums.each_with_index.map do |alb, _index|
        {
          on_spotify: alb.on_spotify, album: alb.album_name, Date: alb.publish_date, id: alb.id
        }
      end
      file.write(JSON.generate(album))
    end
  end

  def read_album
    return [] unless File.exist?('src/database/musicalbum.json')

    musicalbum_json = JSON.parse(File.read('src/database/musicalbum.json'))
    musicalbum_json.map do |album|
      MusicAlbum.new(album['on_spotify'], album['album'], album['Date'])
    end
  end

  def list_all_music_albums
    @musicalbums.each_with_index do |alb, idx|
      print "#{idx})  Album: #{alb.album_name} Date:#{alb.publish_date} "
    end
  end
end
