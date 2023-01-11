require_relative '../items'

class Game < Item
  attr_accessor :multiplayer, :last_played_date

  def initialize(name, publish_date, multiplayer, last_played_date)
    super(name, publish_date)
    @multiplayer = multiplayer
    @last_played_date = last_played_date
  end

  def can_be_archived?
    super ( @last_played_date.nil? || @last_played_date < Date.today - (2 * 365))

    false
  end
end
