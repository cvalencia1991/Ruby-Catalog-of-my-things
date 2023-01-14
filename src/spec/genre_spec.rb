require_relative './spec_helper'

describe Genre do
  describe 'class' do
    it 'creates a new Genre name' do
      genre = Genre.new('cesar')
      expect(genre.name).to eq('cesar')
    end

    it 'items of genre are empty' do
      genre = Genre.new('cesar')
      expect(genre.items).to eq([])
    end

    it 'generate a random id' do
      genre = Genre.new('cesar')
      allow(genre).to receive(:rand).and_return(5)
      result = genre.send(:generate_id)
      expect(result).to eq(5)
    end

    it 'add random item' do
      item = Item.new(true, '2022-02-01')
      genre = Genre.new('cesar', id: 10)
      genre.add_item(item)
      expect(genre.items).to include(item)
    end
  end
end
