require_relative 'genre.rb'
require_relative 'items.rb'
require 'rspec'

describe Genre do
  describe 'Genre class' do
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
      expect(genre.generate_id).to eq(5)
    end
  end
end
