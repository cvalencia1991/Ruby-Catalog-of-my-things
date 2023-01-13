require_relative './author'
require_relative './label'
require_relative './genre'
require_relative './items'
require 'date'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :game_name

  # rubocop:disable Metrics/ParameterLists
  def initialize(game_name, date, multiplayer, last_played_date, archived: false, id: nil)
    # rubocop:enable Metrics/ParameterLists
    super(id, date, archived: archived)
    @game_name = game_name
    @multiplayer = multiplayer
    @last_played_date = Date.parse(last_played_date)
  end

  private

  def can_be_archived?
    current_date = Date.today
    super && (current_date.year - @last_played_date.year) > 2
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'game_name' => @game_name,
      'date' => @publish_date,
      'multiplayer' => @multiplayer,
      'last_played_date' => @last_played_date,
      'archived' => @archived,
      'id' => @id,
      'author' => @author,
      'label' => @label,
      'genre' => @genre
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    album = new(object['game_name'], object['date'], object['multiplayer'], object['last_played_date'],
                archived: object['archived'], id: object['id'])
    author = JSON.parse(JSON.generate(object['author']), create_additions: true)
    label = JSON.parse(JSON.generate(object['label']), create_additions: true)
    genre = JSON.parse(JSON.generate(object['genre']), create_additions: true)
    author.add_item(album)
    label.add_item(album)
    genre.add_item(album)
    album
  end
end
