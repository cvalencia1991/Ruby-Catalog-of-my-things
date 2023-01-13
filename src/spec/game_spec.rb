require_relative './spec_helper'
describe Game do
  before :each do
    @game = Game.new('hello world', '2000/04/04', false, '2021/04/04', archived: false, id: rand(1..1000))
    @game1 = Game.new('hello world', '1999/01/01', false, '2000/01/01')
    @game3 = Game.new('hello world', '2015/01/01', true, '2018/01/01')
  end
  context ' #can_be_archived?' do
    it 'returns false if publish date is greater then 10 years and last played date is less than 2 years ago' do
      @game.move_to_archive
      expect(@game.archived).to be false
    end
    it 'returns true if publish date is more than 10 years last played date is more than 2 years ago' do
      @game1.move_to_archive
      expect(@game1.archived).to be true
    end
    it 'returns false if publish date is less than 10 years last played date is more than 2 years ago' do
      @game3.move_to_archive
      expect(@game3.archived).to be false
    end
  end
end
