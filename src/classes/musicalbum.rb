require_relative 'items'

class MusicAlbum < Item
  attr_reader :id
  attr_accessor :on_spotify

  def initialize(on_spotify, date, archived: false, id: nil)
    super(id, date, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify == true
  end
end
