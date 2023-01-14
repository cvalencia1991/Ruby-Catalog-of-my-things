require_relative './spec_helper'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'intilize on_spotify' do
      musicalbum = MusicAlbum.new(false, 'Nothing was the same', '2022-02-01')
      expect(musicalbum.on_spotify).to eq(false)
    end
  end
  describe 'can be archive method' do
    it 'can be archive the music album' do
      musicalbum = MusicAlbum.new(true, 'Her loss', '2010-02-03')
      result = musicalbum.send(:can_be_archived?)
      expect(result).to eq(true)
    end
  end
end
