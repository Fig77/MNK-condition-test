class Logic
	def initialize
		@logic_grid = [0, 0, 0, 0, 0, 0, 0, 0] # Vector represnt victory conditions. row1-row2-row3-col1-col2-col3-diag1-diag2
		@row = 0 # Represents row of current input.
		@column = 0 # Represents column of current input.
		@move_count = 0 # Cheks if it's a tie.
	end

	def getColumnRow(input)
		if input % 3 == 0
		  @row = (input / 3 ) - 1
		  @column = ((input % 3) + 2) + 3
		else
			@row = (input / 3 )
			@column = ((input % 3) + 2)
		end
	end

	def checkDiagonal(t)
		if @row == @column-3
			@logic_grid[6] += t
		  if ( (@row - (@column-3) ).abs == 2 ||  @row == 1 )
			  @logic_grid[7] += t
		  end
		end
	  return 1 if @logic_grid[6].abs == 3
	  return 1 if @logic_grid[7].abs == 3

	  2
	end

	def checkVerticalHorizontal(t)

		@logic_grid[@row] += t
		@logic_grid[@column] += t
		return 1 if @logic_grid[@row].abs == 3 || @logic_grid[@column].abs == 3
		2
	end

	def gameCondition(input, t) # t will add or substract from @logical_grid depending on player.
		return 0 if @move_count == 8
		@move_count += 1
		getColumnRow(input, t)
		diagonalCheck = checkDiagonal(t)
		return diagonalCheck unless diagonalCheck == 2

		verticalHorizontal = checkVerticalHorizontal(t)
		return verticalHorizontal unless verticalHorizontal == 2
	end
end
