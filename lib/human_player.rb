require "byebug"
require_relative 'board'

class HumanPlayer
  attr_reader :name
  attr_accessor :mark, :board

  def initialize(name)
    @name = name
  end

  def get_move(board)
    puts "Your mark is X! Where do you want to move? (row, col)"
    # move = gets.chomp.split(",").map(&:to_i)
    move = gets.chomp.delete("()").split(",").map(&:to_i)
    # debugger
    if valid_move?(move, board)
      return move
    else
      begin
        raise "error -- that spot is taken"
      rescue
        puts "That spot is taken, try again -- Where do you want to move? (row, col)"
        move = gets.chomp.delete("()").split(",").map(&:to_i)
      end
    end
  end

  def valid_move?(move, board)
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
