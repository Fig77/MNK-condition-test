class Grid
	attr_accessor :grid
	def initialize 
		@grid = ["| 1 | ","| 2 | ","| 3 | ",
						 "| 4 | ","| 5 | ","| 6 | ",
						 "| 7 | ","| 8 | ","| 9 |" ]
	end
	# Could be done in a single string, but will make a small generic M*M version here so I can gradually
	# work on abstraction for the logic of conditions to be applied in my other project.
	def draw
		@grid.each_with_index { |x, i| ( ( i + 1 ) % 3 )  == 0 ? ( puts x ) : ( print x ) }
	end

	end
end
