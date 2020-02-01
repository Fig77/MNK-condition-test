require_relative 'logic'
require_relative 'board'

class Game  # Due to the simplicity of the project all game scenes will be managed from this class
  def initialize(player_one = "Player one", player_two = "Player two")
      @players = [player_one, "| X | ", player_two, "| O | ", false]
      @turn = 1
      @turn_changer = 2
      @game_state = 3
      @board = Grid.new
      puts "Default board size: 3. Go to options to change it."
      @logicAuxiliar = Logic.new
      @game_strings = []
      @check_message = []
      File.foreach("../assets/SHALLYOU.txt") { |x| @check_message.push(x) unless x[0] == "!" }
      File.foreach("../assets/instructions.txt") { |x| @game_strings.push(x) unless x[0] == "!" }
  end

  def shallYou #should not be here 
    puts " YOU SHALL NOT PASS!" 
    @check_message.each do |x| puts x end
    exit
  end

  def run
    while @game_state == 3
      puts "\nWelcome #{@players[0]} and #{@players[2]} \n"
      @game_strings[4...9].each do |x| puts x end
      input = gets.chomp
      shallYou if input.length > 3
      case input.to_i
        when 1
          clear
          startGame
        when 2
          unless @players[4] == false
            startGame
          end
            puts "There is no game to continue!"
        when 3
          puts @game_strings[0]
          @players[0] = gets.chomp
          @players[2] = gets.chomp
          puts "Change board size"
          aux = gets.chomp.to_i
          @logicAuxiliar.k = aux if aux.to_i.between?(1, 999) 
        when 4
          puts ""
          @game_strings[1...4].each do |x| puts x end
          puts ""
        when 5
         exit
        else
          puts "Wrong input"
      end
       break if @game_state == -1
    end
  end

  def startGame
    @game_state = 2
    game_loop
  end

  def game_loop
    while @game_state == 2
      puts "\n #{@players[@turn-1]} its your turn \n"
      @board.draw
      input = gets.chomp
      shallYou if input.length > 3
      break if input == "-1"
      @game_state = @logicAuxiliar.manage_input(input, @turn, @board.grid[input.to_i - 1])
      case @game_state
        when 1, 2
          @board.grid[input.to_i - 1] = @players[@turn]
          @board.draw
          @turn += @turn_changer
          @turn_changer = @turn_changer * -1
        when 4
          puts "That position is taken, or input not between 1 - 9"
          @game_state = 2
        else
       end
    end

  @players[4] = true
  if @game_state == 3
      puts "\n #{@players[@turn - 1]} has won!"
      @board.draw
      clear
    elsif @game_state == 0
      puts "It's a tie!"
      @board.draw
      clear
    end
    @game_state = 3
    run
  end

  def clear
    @game_state = 3
    @board.clear
    @logicAuxiliar.clear
    @turn = 1
    @turn_changer = 2
    @players[4] = false
  end
end
