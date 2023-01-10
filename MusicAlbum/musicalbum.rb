include '../items'

class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify

  def initialize(id, on_spotify, date, archived: false)
    super(id, date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
