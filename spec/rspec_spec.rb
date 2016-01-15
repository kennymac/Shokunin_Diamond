require 'spec_helper'

RSpec.describe 'Coordinate map for "D"', :type => :feature do
  
  @model = nil

  before :all do
     # todo, define model and initializ 
  end

  context('Given D') do 
    it '(0, 3) should contain a character' do
      expect(@model.cellContainsCharacter(0,3)).to eq(true)
    end
  end


end

