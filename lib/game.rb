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

	def run
		input = 3
		while @game_state == 3
		  puts "Welcome #{@players[0]} and #{@players[2]}\n 1. Start Game\n 2. Change names\n 3. Instructions\n 4. Exit"
		  input = gets.chomp
		  case input.to_i
		    when 1
		    	@board.draw
		    	@game_state = 2
		    	game_loop
		    when 2
		    	puts @game_strings[0]
		    	@players[0] = gets.chomp
		    	@players[2] = gets.chomp
		    when 3
		      @game_strings.each_with_index {|value, ind| puts value unless ind == 0}
		    when 4
		    	@game_state = -1
		    else
		    	puts "test"
		  end
    end
  end

  def game_loop
		while @game_state == 2
			puts "#{@players[@turn-1]} its your turn"
			input = gets.chomp

			@game_state = @logicAuxiliar.manage_input(input, @turn, @board.grid[input.to_i - 1])
			
			case @game_state
			  when 4
				  puts "That position is taken, or input not between 1 - 9"
				  @game_state = 2
				when 1, 2
					@board.grid[input.to_i - 1] = @players[@turn]
		      @board.draw
		      @turn += @turn_changer
		      @turn_changer = @turn_changer * -1
		    else
		   end
		end
		if @game_state == 1
			puts "\n #{@players[@turn-3]} has won!" 
		elsif @game_state == 0
			puts "It's a tie!"
		end
		@game_state = 3
		run
	end
end
