require_relative 'items'
require 'json'

class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify, :album_name

  def initialize(on_spotify, album_name, date, archived: false, id: nil)
    super(id, date, archived: archived)
    @on_spotify = on_spotify
    @album_name = album_name
  end

  private

  def can_be_archived?
    super && @on_spotify == true
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
