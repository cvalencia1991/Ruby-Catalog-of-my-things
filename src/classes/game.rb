require_relative './items'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_date

  def initialize(date, multiplayer, last_played_date, archived: false, id: nil)
    super(id, date, archived: archived)
    @multiplayer = multiplayer
    @last_played_date = Date.parse(last_played_date)
  end

  def can_be_archived?
    current_date = Date.today
    super && (current_date.year - @last_played_date.year) > 2
  end
end
