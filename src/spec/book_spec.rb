require_relative './spec_helper'

describe Book do
  before :each do
    @book = Book.new('abc', '2000/01/01', 'Wiley', 'good', archived: true, id: rand(1..1000))
    @book1 = Book.new('abc', '2010/01/11', 'Cole', 'cover', id: rand(1..1000))
    @book2 = Book.new('abc', '2022/01/11', 'Cole', 'bad', id: rand(1..1000))
  end

  context 'When testing a Book class' do
    it 'book should be an instance of Book class' do
      expect(@book).to be_an_instance_of Book
    end

    it 'should return the correct publisher' do
      expect(@book.publisher).to eql 'Wiley'
    end

    it 'should return the correct cover_state' do
      expect(@book.cover_state).to eql 'good'
    end

    it 'should return true when cover state is not bad or not archived' do
      @book1.move_to_archive
      expect(@book1.archived).to be true
    end

    it 'should return true when the cover_state is bad or not archived' do
      @book2.move_to_archive
      expect(@book2.archived).to be true
    end

    it 'should return false publish date is less than 10 years' do
      @book1.publish_date = Date.parse('2022/01/01')
      @book1.move_to_archive
      expect(@book1.archived).to be false
    end
  end
end
