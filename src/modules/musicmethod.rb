require_relative './genre_module'
require_relative './authors_module'
require_relative './label_module'
require_relative './valid_date'
# require 'json'
require 'colorize'
require 'date'

module Methodmusic
  include GenreModule
  include AuthorModule
  include LabelModule

  def list_all_music_albums
    if @albums.empty?
      puts "No Albums to Show 🚫 Please add some Music Albums \n".magenta
    else
      @albums.each_with_index do |album, index|
        print "#[#{index + 1}]:  Music Album: #{album.album_name} | Author: #{album.author.first_name} #{album.author.last_name} |"
        print "Label: #{album.label.title} | Archived: #{album.archived} ╏"
        print "On Spotify: #{album.on_spotify} | Publication_date: #{album.publish_date} |  Genre: #{album.genre.name} "
      end
    end
  end

  def add_music_album
    print 'Enter the name of the album: '
    album_name = gets.chomp
    print 'Enter the publish date of the music album e.g (2023-01-11): '
    date = set_valid_date
    
    album = MusicAlbum.new(nil, album_name, date)


    archive_album(album)

    author = add_author
    author.add_item(album)
    puts "\nAuthor added for album #{album.album_name} successfully 👤✅".green

    label = add_label
    label.add_item(album)
    puts "\nLabel added for album #{album.album_name} successfully 📘✅ ".green

    genre = add_genre
    genre.add_item(album)
    puts "\nGenre added for album #{album.album_name} successfully 🤹‍♂️✅ ".green
  end

  def get_user_input(prompt, valid_responses)
    while true
      print prompt
      input = gets.chomp
      break if valid_responses.include?(input)

      puts "\n🛑 ❌ Invalid input. Please enter one of the following: #{valid_responses.join(', ')} \n".red
    end
    input
  end

  def archive_album(album)

    on_spotify = (get_user_input('Is the album on Spotify? (y/n): ', %w[y n]) == 'y')
    album.on_spotify = on_spotify
    
    current_date = Date.today
    year = current_date.year - album.publish_date.year
  
    if  year > 10 && on_spotify
      archived = (get_user_input('Do you want to archive this album? (y/n): ', %w[y n]) == 'y')
      album.archived = archived
      if archived
        if get_user_input('Do you want to confirm archiving this album (y/n): ', %w[y n]) == 'y'
          album.move_to_archive
          puts "\nAlbum archived and created successfully 📕✅ ".green
        else
          album.archived = false
          puts "\nAlbum not archived but created successfully 📕✅ ".green
        end
      else
        puts "\nAlbum created successfully 📕✅".green
      end
    elsif !on_spotify
      puts "\nThe album is not on Spotify. It cannot be archved. Album created successfully 📕✅".green
    else !year
      puts "\nThe album is not older than 10 years. It cannot be archived. Album created successfully 📕✅".green
    end
    @albums << album
  end

  # def save_album
  #   File.open('src/database/musicalbum.json', 'w') do |file|
  #     album = @musicalbums.each_with_index.map do |alb, _index|
  #       {
  #         on_spotify: alb.on_spotify, album: alb.album_name, Date: alb.publish_date, id: alb.id
  #       }
  #     end
  #     file.write(JSON.generate(album))
  #   end
  # end

  # def read_album
  #   return [] unless File.exist?('src/database/musicalbum.json')

  #   musicalbum_json = JSON.parse(File.read('src/database/musicalbum.json'))
  #   musicalbum_json.map do |album|
  #     MusicAlbum.new(album['on_spotify'], album['album'], album['Date'])
  #   end
  # end
end
