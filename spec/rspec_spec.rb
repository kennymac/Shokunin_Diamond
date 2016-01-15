require 'spec_helper'

RSpec.describe 'Coordinate map for "D"', :type => :feature do

class TextGridModel
   
   @char_offset=0

   def initialize(char)
     @char_offset = get_char_offset(char);
   end

   def char_offset 
     @char_offset;
   end

   def get_char_offset(char)
     char.ord - 65
   end

   private :get_char_offset
   
end

  before :all do
     # todo, define model and initializ 
  end

  # context('Given D') do 
  #   it '(0, 3) should contain a character' do
  #     expect(@model.cellContainsCharacter(0,3)).to eq(true)
  #   end
  # end

  context('Given input D') do 
     it 'charOffset should equal 3' do
       charOffset = TextGridModel.new('D').char_offset
       expect(charOffset).to eq(3)
     end
   end


end

