class Author
  attr_accessor :first_name, :last_name, :id, :items

  def initialize(first_name, last_name, id: nil)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end
end
