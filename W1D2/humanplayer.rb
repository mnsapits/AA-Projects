class HumanPlayer

  def initialize(name)
    @name = name
  end

  def get_input(board)
    first_guessed_pos = gets.chomp.split(',')
    first_guessed_pos.map! {|n| n.to_i}
    until board.board[first_guessed_pos[0]][first_guessed_pos[1]].face_up == false
      puts "That's already guessed!"
      first_guessed_pos = gets.chomp.split(',')
      first_guessed_pos.map! {|n| n.to_i}
    end

    first_guessed_pos
  end

end
