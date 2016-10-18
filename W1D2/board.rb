require_relative 'card'

class Board
  attr_accessor :board
  def initialize
    @board = []
  end

  def won?
    @board.all? do |row|
      row.all? {|card| card.face_up}
    end
  end

  def reveal(guessed_pos)
    current_card = @board[guessed_pos[0]][guessed_pos[1]]
    current_card.toggle_on
    render
  end

  def pair(first_pos,second_pos)
    first_card = @board[first_pos[0]][first_pos[1]]
    second_card = @board[second_pos[0]][second_pos[1]]
    unless first_card.value == second_card.value
      sleep(0.5)
      first_card.toggle_off 
      second_card.toggle_off
    end
  end

  def populate
    card_values = (0..9).to_a + (0..9).to_a
    card_values.shuffle!
    card_values.map! do |value|
      Card.new(value)
    end
    holder = []
    card_values.each do |value|
      holder << value
      if holder.length == 5
        @board << holder
        holder = []
      end
    end
  end

  def render
    puts "Current Board:"
    @board.each do |row|
      puts value_izer(row).join("|")
    end
  end

  def value_izer(row)
    row.map do |card|
      if card.face_up
        card.value
      else
        :-
      end
    end
  end

end
