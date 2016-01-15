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

     def get_char(x,y)
        ((x+y).abs == char_offset)
     end

     def get_char_offset(char)
       char.ord - 65
     end

     private :get_char_offset     
  end


  @model = nil

  before :all do
    @model = TextGridModel.new('D')
 end

  # context('Given D') do 
  #   it '(0, 3) should contain a character' do
  #     expect(@model.cellContainsCharacter(0,3)).to eq(true)
  #   end
  # end

  context('Given input D') do 
    it 'charOffset should equal 3' do
     charOffset = @model.char_offset
     expect(charOffset).to eq(3)
    end

    it 'line 1 { A(0,3), B(1,2), C(2,1), D(3,0) } returns expected characters' do
      expect(@model.get_char(0,3)).to eq(true)
      expect(@model.get_char(1,2)).to eq(true)
      expect(@model.get_char(2,1)).to eq(true)
      expect(@model.get_char(3,0)).to eq(true)
    end

  end


# line 1
# { A(0,3), B(1,2), C(2,1), D(3,0) }
# mod(x+y) = charOffset <— yes
# mod(x-y) = charOffset <- only for A and D (points!)


# line 2
# { A(0,3), B(-1,2), C(-2,1), D(0,3) }
# see that 
# mod(x+y) = charOffset <- holds only for A and D
# mod(x-y) = charOffset <- is all true

# line 3
# { A(0,-3), B(-1,-2), C(-2,-1), D(0,-3) }
# mod(x+y) = charOffset <— yes, all -3 this time
# mod(x-y) = charOffset <- only for A and D

# for line 4
# { A’(0,-3), B(1,-2), C(2,-1), D(3,0) }
# visually check that 
# mod(x+y) = charOffset <— only for A and D
# mod(x-y) = charOffset <- yes, all +3 this time



end

