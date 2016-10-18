require_relative 'board'
require_relative 'humanplayer'
require_relative 'computerplayer'

class Game

  def initialize(board, player)
    @board = board
    @player = player
  end

  def play
    @board.board.each do |row|
      p row.map {|card| card.value}
    end


    puts "Let's start the game!"
    until @board.won?
      system("clear")
      @board.board.each do |row|
        p row.map {|card| card.value}
      end
      @board.render
      puts "Input first guess in the form row(0 - 3), column(0 - 4)\ne.g 0,4"
      first_guessed_pos = @player.get_input(@board)
      system("clear")
      @board.board.each do |row|
        p row.map {|card| card.value}
      end
      @board.reveal(first_guessed_pos)
      puts "Give me your second guess also in the same form row(0 - 3), column(0 - 4)\ne.g 0,4"
      second_guessed_pos = @player.get_input(@board)
      until first_guessed_pos != second_guessed_pos
        puts "Guess again that's the same position!"
        second_guessed_pos = @player.get_input(@board)
      end
      system("clear")
      @board.reveal(second_guessed_pos)
      @board.pair(first_guessed_pos,second_guessed_pos)
    end
    puts "congrats you won"
  end

  def check?(first_guessed_pos, second_guessed_pos)
    if first_guessed_pos == second_guessed_pos
      puts "Guess again that's the same position!"
      second_guessed_pos = gets.chomp.split(',')
    end

  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new
  board.populate
  board.render
  puts "Are you a Human? Give me your name? If not type 'c'"
  player_type = gets.chomp
  if player_type.downcase != "c"
    player = HumanPlayer.new(player_type)
  else
    player = ComputerPlayer.new
  end
  new_game = Game.new(board, player)
  new_game.play
end
