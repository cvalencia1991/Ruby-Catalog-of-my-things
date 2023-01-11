require_relative './spec_helper'

describe Label do
  before :each do
    @label = Label.new('Fundamental of Physics', 'cyan', id: rand(1..1000))
    @item = Item.new(1, '2023/01/12')
  end

  context 'When testing a Label class' do
    it 'label should be an instance of Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should return the correct title' do
      expect(@label.title).to eql 'Fundamental of Physics'
    end

    it 'should return 1 when first item is added to items array' do
      @label.add_item(@item)
      expect(@label.items.length).to eql 1
    end

    it 'should add item to the items aray' do
      @label.add_item(@item)
      expect(@label.items[0]).to eql @item
    end

    it "should sets the item's label property to the label" do
      @label.add_item(@item)
      expect(@item.label).to eql @label
    end
  end
end
