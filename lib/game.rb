require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require "byebug"
class Game
  attr_accessor :current_player, :player1, :player2, :board

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    player1.mark = :X
    player2.mark = :O
    @current_player = player2
    @board = Board.new
  end

  def play
    current_player.display(board)

    until board.over?
      play_turn
    end

    if game_winner
      game_winner.display(board)
      puts "#{game_winner.name} wins!"
    else
      puts "No winner :("
    end
  end

  def play_turn
    board.place_mark(current_player.get_move(board), current_player.mark)
    switch_players!
    current_player.display(board)
  end

  def game_winner
    return player1 if board.winner == player1.mark
    return player2 if board.winner == player2.mark
    nil
  end

  def switch_players!
    self.current_player = current_player == player1 ? player2 : player1
  end
end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  lila = ComputerPlayer.new('d0Ra the ComPutaDora')

  new_game = Game.new(human, lila)
  new_game.play
end
