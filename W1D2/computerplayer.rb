class ComputerPlayer
  def initialize
    @known_cards = Hash.new { |hash, key| hash[key] = [] }
    @matched_cards = []
  end

  def get_input(board)
    pos = [(0..3).to_a.sample, (0..4).to_a.sample] if @matched_cards.empty? && @known_cards == {}
    
    @known_cards[board.board[pos[0]][pos[1]].value] << pos
    @known_cards.each do |key,value|
      if value.length == 2

      end
    end

    pos
  end

end
