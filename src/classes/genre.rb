require_relative 'items'
require 'json'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: nil)
    @id = id.nil? ? generate_id : id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  private

  def generate_id
    rand(1..1000)
  end

  public

  def as_json()
    {
      JSON.create_id => self.class.name,
      'name' => @name,
      'id' => @id
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(object['name'], id: object['id'])
  end
end
