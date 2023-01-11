require 'spec_helper'

describe Label do

  before :each do
    @label = Label.new('Fundamental of Physics', 'cyan', id: rand(1..1000))
  end

  context 'When testing a Label class' do
    it 'label should be an instance of Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'should return the correct title' do
      expect(@label.title).to eql 'Fundamental of Physics'
    end
  end
end
