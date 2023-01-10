require '../items'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: nil)
    @id = id.nil? ? Random.rand(1..1000) : id
    @name = name.to_s unless name.is_a? String
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre(self)
  end
end
