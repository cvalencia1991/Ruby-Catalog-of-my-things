require_relative '../../items.rb'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(date, publisher, cover_state, archived: false, id: nil)
    super(id, date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  private
  
  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
