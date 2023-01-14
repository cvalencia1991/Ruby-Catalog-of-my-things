require 'json'

class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end

  def as_json()
    {
      JSON.create_id => self.class.name,
      'first_name' => @first_name,
      'last_name' => @last_name
    }
  end

  def to_json(*options)
    as_json.to_json(*options)
  end

  def self.json_create(object)
    new(object['first_name'], object['last_name'])
  end
end
