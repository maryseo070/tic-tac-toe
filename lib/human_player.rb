require "byebug"
require_relative "board"
class HumanPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name
  end

  def get_move
    puts "Your mark is X! Where do you want to move? (row, col)"
    # move = gets.chomp.split(",").map(&:to_i)
    move = gets.chomp.delete("()").split(",").map(&:to_i)
    # debugger
    valid_move?(move) ? move : "invalid move -- format (row, col)"
  end

  def valid_move?(move)
    # debugger
    if board[move] == nil
      return true
    else
      return false
    end
  end

  def display(board)
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
    end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
    puts "  |-----------|"
  end
end