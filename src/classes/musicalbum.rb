require_relative 'items'

class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify, :album_name

  def initialize(on_spotify, album_name, date, archived: false, id: nil)
    super(id, date, archived: archived)
    @on_spotify = on_spotify
    @album_name = album_name
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
