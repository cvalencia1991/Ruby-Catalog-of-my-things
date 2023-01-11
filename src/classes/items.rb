require 'date'

class Item
  attr_accessor :genre, :author, :label, :archived, :publish_date

  def initialize(id, date, archived: false)
    @id = id.nil? ? Random.rand(1..1000) : id
    @publish_date = Date.parse(date)
    @archived = archived
    @author = nil
  end

  private

  def can_be_archived?
    current_date = Date.today
    year = current_date.year - @publish_date.year
    return false if year < 10

    true
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
  end

  #   def add_author(author)
  #     @author = author
  #     return if author.nil?

  #     item.add_author(self) unless item.authors.include?(self)
  #   end
end
