class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark
  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move(board)
    moves = []
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        moves << pos if board[pos].nil?
      end
    end
    moves.each do |move|
      # debugger
    return move if win?(move)
    return move if defense?(move)
    return move if move == [1, 1]
  end

  moves.sample
  end

  def win?(move)
    board[move] = mark
    if board.winner == mark
      # debugger
      board[move] = nil
      true
    else
      board[move] = nil
      false
    end
  end

  def defense?(move)
    board[move] = :X
    if board.winner == :X
      # debugger
      board[move] = nil
      return true
    else
      board[move] = nil
      false
    end
  end

end
