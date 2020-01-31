class Logic
  attr_writer :k, :board

	def initialize(k = 3)
		@row = 0 # Represents row of current input. 
		@column = 0 # Represents column of current input.
		@move_count = 0 # Cheks if it's a tie.
		@k = k
		defineLogicGrid
	end

	def defineLogicGrid
		@logic_grid = []
		((@k*@k) + 2).times { |x| @logic_grid.push(0) }
	end

	def getColumnRow(input)
		@column = ( (input - 1) % @k) + @k
		@row = ( (input - 1) / @k)
	end

	def checkDiagonal(t)
		if @row == @column - @k
			@logic_grid[@logic_grid.size - 2] += t
		end
		if ((@row - (@column - @k)).abs == 2 || @row + @column == 5 )
			@logic_grid[@logic_grid.size - 1] += t
		end
	  return 3 if @logic_grid[@logic_grid.size - 2].abs == @k
	  return 3 if @logic_grid[@logic_grid.size - 1].abs == @k

	  2
	end

	def checkVerticalHorizontal(t)

		@logic_grid[@row] += t
		@logic_grid[@column] += t
		return 3 if @logic_grid[@row].abs == @k || @logic_grid[@column].abs == @k
		2
	end

	def gameCondition(input, t) # t will add or substract from @logical_grid depending on player.
		
		getColumnRow(input)
		diagonalCheck = checkDiagonal(t)
		@move_count += 1
		return diagonalCheck unless diagonalCheck == 2
		verticalHorizontal = checkVerticalHorizontal(t)
		return verticalHorizontal unless verticalHorizontal == 2
		
		return 0 if @move_count == @k * @k
		2
	end

	def manage_input(input, turn, taken)
		if taken == "| X | " || taken == "| O | " || input.length > 3 || !input.to_i.between?(0, (@k*@k))
			return 4
    end
		unless input.to_i == 0
  	  return gameCondition(input.to_i, (-1*turn + 2) )
  	else
  		5
  	end
	end

  def clear
  	@move_count = 0
  	defineLogicGrid
  end
end
