require_relative './spec_helper'

describe Author do
  let(:author) { Author.new('John', 'Doe', 1) }
  let(:item) { Item.new(true, '2022-02-01') }

  it 'has a first name' do
    expect(author.first_name).to eq('John')
  end

  it 'has a last name' do
    expect(author.last_name).to eq('Doe')
  end

  it 'has an id' do
    expect(author.id).to eq(1)
  end

  it 'has a items array that starts empty' do
    expect(author.items).to eq([])
  end

  describe '#add_item' do
    it 'adds an item to the items array' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'sets the item\'s author to the current author' do
      allow(item).to receive(:author=)
      author.add_item(item)
      expect(item).to have_received(:author=).with(author)
    end
  end
end
