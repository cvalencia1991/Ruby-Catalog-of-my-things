require 'spec_helper'


describe Book do

  before :each do
    @book = Book.new('2000/01/01', 'Wiley', 'good', archived: true, id: rand(1..1000))
    @book1 = Book.new('2010/01/11', 'Cole', 'cover', id: rand(1..1000))
    @book2 = Book.new('000/01/11', 'Cole', 'bad',  id: rand(1..1000))
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
  end
end
