require_relative './items'
require 'json'

class Label
  attr_accessor :title, :author, :items, :color

  def initialize(title, color, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'color' => @color,
      'id' => @id
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(object['title'], object['color'], id: object['id'])
  end
end
