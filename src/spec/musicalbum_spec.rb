require_relative '../classes/musicalbum'
require_relative '../classes/items'
require 'rspec'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'intilize on_spotify' do
      musicalbum = MusicAlbum.new('Nothing was the same', false, '2022-02-01')
      expect(musicalbum.on_spotify).to eq(false)
    end
  end
  describe 'can be archive method' do
    it 'can be archive the music album' do
      musicalbum = MusicAlbum.new('Her loss', true, '2022-02-03')
      result = musicalbum.send(:can_be_archived?)
      expect(result).to eq(true)
    end
  end
end
