require_relative '../classes/genre'
require_relative '../classes/items.rb'
require 'rspec'

describe Genre do
  describe 'class' do
    it 'creates a new Genre name' do
      genre = Genre.new('cesar')
      expect(genre.name).to eq('cesar')
    end

    it 'creates a new Genre name' do
      genre = Genre.new('cesar')
      expect(genre.items).to eq([])
    end

    it 'generate a random id' do
      genre = Genre.new('cesar')
      allow(genre).to receive(:rand).and_return(5)
      result = genre.send(:generate_id)
      expect(result).to eq(5)
    end

    let(:item) { Item.new('archived', DateTime.now.to_s) }

    it 'add random item' do
      genre = Genre.new('cesar', id: 10)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
