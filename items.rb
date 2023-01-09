require 'date'

class Item
  def initialize(id, date, archived: false)
    @id = id.nil? ? Random.rand(1..1000) : id
    @publish_date = Date.parse(date)
    @archived = archived
  end
  attr_writer :genre, :author, :label

  def can_be_archived?
    current_date = Date.today
    year = current_date.year - @publish_date.year
    return true unless year > 10

    false
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
