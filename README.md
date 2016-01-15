# Shokunin_Diamond

##Diamond generator - analysis and spec

###Model idea
If we think of the grid as cells centred around the origin, with their points on the 0 axes - 

  -3-2-1 0 1 2 3
 3       A1
 2     B   B
 1   C       C
 0 D           D
-1   C       C
-2     B   B
-3       A2

###Char offset 
We define the limit of the grid as 
charOffset = 3

char = ascii(input) - 65

###Grid cell derivation

We can derive a character function for any given cell(x,y) by noticing that the diamond exists as four lines.  

line 1
	{ A(0,3), B(1,2), C(2,1), D(3,0) }
can be described as 
	x + y = 3
or 
	x + y = charOffset

line 2
	{ A(0,3), B(-1,2), C(-2,1), D(0,3) }
implies 
	y - x = charOffset
or 
	x - y = -charOffset

line 3
	{ A(0,-3), B(-1,-2), C(-2,-1), D(0,-3) }
so, 
	x + y = -charOffset

for line 4
	{ A’(0,-3), B(1,-2), C(2,-1), D(3,0) }
so
	x - y = charOffset


So, a character is present in a cell if any of the following is true - 
x + y == charOffset
x + y == -charOffset
x - y == charOffset
x - y == -charOffset

simplified to 
mod(x+y) == charOffset
mod(x-y) == charOffset

###Model test... on paper first!
Lets do a test on paper.  You could begin to write unit tests for this if the functions were more complex.


  -3-2-1 0 1 2 3
 3       A
 2     B1  B2
 1   C       C
 0 D           D
-1   C       C
-2     B   B
-3       A’


line 1
{ A(0,3), B(1,2), C(2,1), D(3,0) }
mod(x+y) = charOffset <— yes
mod(x-y) = charOffset <- only for A and D (points!)


line 2
{ A(0,3), B(-1,2), C(-2,1), D(0,3) }
see that 
mod(x+y) = charOffset <- holds only for A and D
mod(x-y) = charOffset <- is all true

line 3
{ A(0,-3), B(-1,-2), C(-2,-1), D(0,-3) }
mod(x+y) = charOffset <— yes, all -3 this time
mod(x-y) = charOffset <- only for A and D

for line 4
{ A’(0,-3), B(1,-2), C(2,-1), D(3,0) }
visually check that 
mod(x+y) = charOffset <— only for A and D
mod(x-y) = charOffset <- yes, all +3 this time


##Character returned
Lastly, the character returned for a cell (x,y) is simply defined by |x| (i.e. absolute value of x)
char = ascii(65+x.abs) etc



