require_relative './items'
require_relative './author'
require_relative './label'
require_relative './genre'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state, :title, :label

  # rubocop:disable Metrics/ParameterLists
  def initialize(title, date, publisher, cover_state, archived: false, id: nil)
    # rubocop:enable Metrics/ParameterLists
    super(id, date, archived: archived)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'date' => @publish_date,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
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
    album = new(object['title'], object['date'], object['publisher'], object['cover_state'],
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
