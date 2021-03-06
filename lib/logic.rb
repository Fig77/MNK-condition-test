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

	def manage_input(input, turn, taken)
		if taken != "| I | " || input.length > 3 || !input.to_i.between?(1, (@k*@k))
			return 4
    end
  	  return gameCondition(input.to_i, (-1*turn + 2) )
	end

	def gameCondition(input, t) # t will add or substract from @logical_grid depending on player.
		getColumnRow(input)
		diagonalCheck = checkDiagonal(t)
		verticalHorizontal = checkVerticalHorizontal(t)
		@move_count += 1
		return diagonalCheck unless diagonalCheck == 2
		return verticalHorizontal unless verticalHorizontal == 2
		return 0 if @move_count == @k * @k

		2
	end

	def getColumnRow(input)
		@column = ( (input - 1) % @k) + @k
		@row = ( (input - 1) / @k)
	end

	def checkDiagonal(t)
		if @row == @column - @k
			@logic_grid[@logic_grid.size - 1] += t
			return 3 if @logic_grid[@logic_grid.size - 1].abs == @k
		end
		if ((@row - (@column - @k)).abs == @k - 1 || @row + @column == @k + (@k - 1) )
			@logic_grid[@logic_grid.size - 2] += t
			return 3 if @logic_grid[@logic_grid.size - 2].abs == @k
		end

	  2
	end

	def checkVerticalHorizontal(t)
		@logic_grid[@row] += t
		@logic_grid[@column] += t
		return 3 if @logic_grid[@row].abs == @k || @logic_grid[@column].abs == @k

		2
	end

  def clear
  	@move_count = 0
  	defineLogicGrid
  end
end
