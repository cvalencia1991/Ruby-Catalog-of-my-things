require_relative './genre_module'
require_relative './authors_module'
require_relative './label_module'
require_relative './valid_date'
require 'json'
require 'colorize'
require 'date'

module MusicModule
  include GenreModule
  include AuthorModule
  include LabelModule

  def list_all_music_albums
    if @albums.empty?
      puts "\nNo Albums to Show 🚫 Please add some Music Albums . . .".magenta
    else
      puts "\nAvailable Music Albums in the list 🎵 🎧 : #{@albums.count} \n".magenta
      @albums.each_with_index do |album, index|
        print "[ #{index + 1} ]:  Music Album: #{album.album_name} | Author: #{album.author.first_name} "
        print "#{album.author.last_name} |  Label: #{album.label.title}  | Archived: #{album.archived} | "
        puts "On Spotify: #{album.on_spotify} | Publication_date: #{album.publish_date} | Genre: #{album.genre.name}"
      end
    end
  end

  def add_music_album
    print 'Enter the name of the music album: '
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

  # rubocop:disable Metrics/PerceivedComplexity
  # rubocop:disable Metrics/MethodLength
  def archive_album(album)
    on_spotify = (get_user_input('Is the music album on Spotify? (y/n): ', %w[y n]) == 'y')
    album.on_spotify = on_spotify

    current_date = Date.today
    year = current_date.year - album.publish_date.year

    if year > 10 && on_spotify
      archived = (get_user_input('Do you want to archive this music album? (y/n): ', %w[y n]) == 'y')
      album.archived = archived
      if archived
        if get_user_input('Do you want to confirm archiving this album (y/n): ', %w[y n]) == 'y'
          album.move_to_archive
          puts "\nMusic album archived and created successfully 🎵 ✅ ".green
        else
          album.archived = false
          puts "\nMusic album not archived but created successfully 🎵 ✅ ".green
        end
      else
        puts "\nMusic album created successfully 🎵 ✅".green
      end
    elsif !on_spotify
      puts "\nThe music album is not on Spotify. It cannot be archved. Album created successfully 🎵 ✅".green
    else
      puts "\nThe music album is not older than 10 years. It cannot be archived. Album created successfully 🎵 ✅".green
    end
    @albums << album
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/PerceivedComplexity
end
