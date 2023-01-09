require '../item'

class Genre < Item

    attr_reader :item

  def initialize(name, genre)
    super(genre)
    @name = name.to_s unless name.is_a? String
    @items = []
  end

  def self.add_item
    @items << genre
  end

end
