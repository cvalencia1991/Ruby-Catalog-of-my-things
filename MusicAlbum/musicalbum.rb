include '../items'
include '../Genre/genre'

class MusicAlbum < Genre
  attr_reader :archived

  def initialize(on_spotify: true)
    @on_spotify = on_spotify
    super(archived)
  end

  private

  def can_be_archived?
    true if @archived == true && @on_spotify == true
    false
  end
end
