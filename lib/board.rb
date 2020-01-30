class Grid
	attr_accessor :grid
	attr_accessor :m, :n
	def initialize(m = 3, n = 3)
		@m = m
		@n = n
		@grid = []
		(@m*@n).times { @grid.push("| I | ") }
	end
	# Could be done in a single string, but will make a small generic M*M version here so I can gradually
	# work on abstraction for the logic of conditions to be applied in my other project.
	def draw
		@grid.each_with_index { |x, i| ( ( i + 1 ) % @n )  == 0 ? ( puts x ) : ( print x ) }
	end

	def clear
		@grid = []
		(@m*@n).times { @grid.push("| I | ") }
	end

end
