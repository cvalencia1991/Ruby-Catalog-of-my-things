require 'date'
require 'json'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :game_name

  def initialize(game_name, date, multiplayer, last_played_date, archived: false, id: nil)
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
      'on_spotify' => @on_spotify,
      'album_name' => @album_name,
      'date' => @publish_date,
      'archived' => @archived,
      'id' => @id
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    album = new(object['on_spotify'], object['album_name'], object['date'], archived: object['archived'], id: object['id'])
  end
end
