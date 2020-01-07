class Game 	# Due to the simplicity of the project all the game will be managed from this class
	def initialize(player_one = "Player one", player_two = "Player two")
		@players = [player_one, "| X | ", player_two, "| O | "]
		@turn = 1
		@turn_changer = 2
		@board = Grid.new
		@game_state = 3
	end

	def main_loop
		while @game_state == 3
		  print "Welcome ${@player_one} and ${@player_two}"
		  puts "1. Start Game\n 2. Change names\n 3. Instructions\n 4. Exit"
		  input = gets.chomp
    end
	end
end






players = []
logicAuxiliar = Logic.new
board = Grid.new
turn = 1
turn_changer = 2
puts "Name 1"
players.push(gets.chomp)
players.push("| X | ")
puts "Name 2"
players.push(gets.chomp)
players.push("| O | ")
puts " "
input = gets.chomp
game_state = 2
while input.to_i != -1 do
  board.grid[input.to_i - 1] = players[turn]
  board.draw
  game_state = logicAuxiliar.gameCondition(input.to_i, (-1*turn + 2) )
  puts "GANASTE!" if  game_state == -1 || game_state == 1
  turn += turn_changer
  turn_changer = turn_changer * -1
  input = gets.chomp
end