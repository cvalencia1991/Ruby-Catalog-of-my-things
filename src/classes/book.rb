require_relative '../items'

class Book < Item
  
  def initialize(date, publisher, cover_state, archived: archived, id: nil)
    super(id, date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end
end
