require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :game_name

  def initialize(game_name, date, multiplayer, last_played_date, archived: false, id: nil)
    super(id, date, archived: archived)
    @game_name = game_name
    @multiplayer = multiplayer
    @last_played_date = Date.parse(last_played_date)
  end

  private

  def can_be_archived?
    current_date = Date.today
    super && (current_date.year - @last_played_date.year) > 2
  end
end
