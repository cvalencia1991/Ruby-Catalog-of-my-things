require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_date

  def initialize(name, publish_date, multiplayer, last_played_date)
    super(name, publish_date)
    @multiplayer = multiplayer
    @last_played_date = last_played_date
  end

  def to_s
    "Game: #{@name}, #{@publish_date}, #{@multiplayer}, #{@last_played_date}"
  end

  def can_be_archived?
    current_date = Date.today
    year = current_date.year - @publish_date.year
    return true if year > 2

    false
  end
end
