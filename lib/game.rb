require_relative 'logic'
require_relative 'board'

class Game 	# Due to the simplicity of the project all the game will be managed from this class
	def initialize(player_one = "Player one", player_two = "Player two")
		@players = [player_one, "| X | ", player_two, "| O | ", false]
		@turn = 1
		@turn_changer = 2
		@board = Grid.new
		@game_state = 3
		@game_strings = []
		@logicAuxiliar = Logic.new
		File.foreach("../assets/instructions.txt") { |x| @game_strings.push(x) unless x[0] == "!" }
	end

	def run
		input = 3
		while @game_state == 3
		  puts "Welcome #{@players[0]} and #{@players[2]}"
		  @game_strings[4...9].each do |x| puts x end
		  input = gets.chomp
		  case input.to_i
		    when 1
		    	@players[4] = false
		    	startGame
		    when 2
		    	unless @players[4] == false
		    		startGame
		    	end
		    	puts "\n"+@game_strings[9]+"\n"
		    when 3
		      puts @game_strings[0]
		    	@players[0] = gets.chomp
		    	@players[2] = gets.chomp
		    when 4
		    	@game_strings[1...4].each do |x| puts x end
		    when 5
		    	@game_state = -1
		    else
		    	puts "test"
		  end
    end
  end

  def startGame
  	@board.clear
  	@board.draw
  	@logicAuxiliar.clear
  	@turn = 1
  	@turn_changer = 2
		@game_state = 2
		game_loop
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
			@turn += @turn_changer
			puts "\n #{@players[@turn - 1]} has won!"
			@board.clear
			@players[4] = false
			run
		elsif @game_state == 0
			puts "It's a tie!"
			@board.clear
			@players[4] = false
			@logicAuxiliar.clear
			run
		end
		@game_state = 3
		@players[4] = true
		run
	end
end
