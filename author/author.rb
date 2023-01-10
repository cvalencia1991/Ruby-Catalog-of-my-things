require_relative '../items'

class Author
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end
  attr_reader :first_name, :last_name

  def add_item(item)
    @items.push(item)
  end
end
