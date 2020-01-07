require_relative 'logic'
require_relative 'board'

class Game 	# Due to the simplicity of the project all the game will be managed from this class
	def initialize(player_one = "Player one", player_two = "Player two")
		@players = [player_one, "| X | ", player_two, "| O | "]
		@turn = 1
		@turn_changer = 2
		@board = Grid.new
		@game_state = 3
		@game_strings = []
		@logicAuxiliar = Logic.new
		File.foreach("../assets/instructions.txt") { |x| @game_strings.push(x) }
	end

	def main_loop
		while @game_state == 3
		  print "Welcome ${@player_one} and ${@player_two}"
		  puts "1. Start Game\n 2. Change names\n 3. Instructions\n 4. Exit"
		  input = gets.chomp
		  case input
		    when 1
		    	@board.draw
		    	@game_state = 2
		    when 2
		    	puts @game_strings[0]
		    	@player_one = gets.chomp
		    	@player_two = gets.chomp
		    when 3
		    	puts @game_strings[1]
		    when 4
		    	@game_state = -1
		    else
		  end
    end

		while @game_state == 2
			puts "${@players[@turn-1] its your turn}"
			loop do
			  input = gets.chomp
			  break if input.between?(1, 9)
			end
		  @board.grid[input.to_i - 1] = players[turn]
  		@game_state = @logicAuxiliar.gameCondition(input.to_i, (-1*turn + 2) )
  		puts "GANASTE!" if  game_state == -1 || game_state == 1
  		@turn += @turn_changer
  		@turn_changer = @turn_changer * -1
		 end
	end
end
