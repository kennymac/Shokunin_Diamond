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
        if ((x+y).abs == char_offset || (x-y).abs == char_offset)
          (x.abs + 65).chr
        else
          ' '
        end
     end

     def grid
       
       x = 0;
       y = -@char_offset;
       result = ""
    
      while y <= @char_offset do

        x = -@char_offset;

        while x <= @char_offset do
          chr = get_char(x,y)
          result = result + chr
          x+=1;
        end
        y+=1
        result = result + "\n"
      end

      puts("result:\n#{result}")

      return result
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

  context('Given input D') do 
    it 'charOffset should equal 3' do
     charOffset = @model.char_offset
     expect(charOffset).to eq(3)
    end

    it 'line 1 { A(0,3), B(1,2), C(2,1), D(3,0) } returns expected characters' do
      expect(@model.get_char(0,3)).to eq('A')
      expect(@model.get_char(1,2)).to eq('B')
      expect(@model.get_char(2,1)).to eq('C')
      expect(@model.get_char(3,0)).to eq('D')
    end

    it 'line 4 { A’(0,-3), B(1,-2), C(2,-1), D(3,0) } returns expected characters' do
      expect(@model.get_char(0,-3)).to eq('A')
      expect(@model.get_char(1,-2)).to eq('B')
      expect(@model.get_char(2,-1)).to eq('C')
      expect(@model.get_char(3,0)).to eq('D')
    end

    it 'not on centre line' do
      expect(@model.get_char(0,-3)).to eq('A')
      expect(@model.get_char(0,-2)).to eq(' ')
      expect(@model.get_char(0,-1)).to eq(' ')
      expect(@model.get_char(0, 0)).to eq(' ')
      expect(@model.get_char(0, 3)).to eq('A')
      expect(@model.get_char(0, 2)).to eq(' ')
      expect(@model.get_char(0, 1)).to eq(' ')
    end

    it 'generates grid' do
      expect(@model.grid()).to eq("   A   \n  B B  \n C   C \nD     D\n C   C \n  B B  \n   A   \n")
    end

  end

  context('Given C') do 
    it 'A correct diamond should be returned' do
      model = TextGridModel.new('C')
      expect(model.grid()).to eq("  A  \n B B \nC   C\n B B \n  A  \n")
    end
  end

  context('Given A') do 
    it 'A single character diamond should be returned' do
      model = TextGridModel.new('A')
      expect(model.grid()).to eq("A\n")
    end
  end

  context('Given Z') do 
    it 'A big diamond qill be put to console' do
      model = TextGridModel.new('Z')
      model.grid()
    end
  end

  context('Given lowe case') do 
    it 'For now it just renders both' do
      model = TextGridModel.new('z')
      model.grid()
    end
  end

  context('Given char less than A') do 
    it 'Nothing returned' do
      model = TextGridModel.new('!')
      expect(model.grid()).to eq("")
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

