# lib/board.rb

require_relative '../lib/player'
require_relative '../lib/board'

class Game

  WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]].freeze

  @@game_result = "It's a draw!"

  def initialize (player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @official_board = Board.new #sustituido
  end

  def beginning_message
    %(Great! We are all set.
#{@player_one.name} will play #{@player_one.mark}s and #{@player_two.name} will play #{@player_two.mark}s.\n
)
  end

  def display_board
    @official_board.print_board
  end

  def whos_turn_player
    if @official_board.plays_count.even? 
      return @player_one
    else 
      return @player_two
    end
  end

  def game_over? 
    if @official_board.plays_count > 9
      return true
    else 
      if @official_board.plays_count > 4 && winning_move?(whos_turn_player.plays)
        @@game_result = "#{whos_turn_player.name} is the Winner!"
      end
    end
  end

  def winning_move?(marked_cells)
    WIN_COMBINATION.each do |arr_winner|
      if marked_cells.include?(arr_winner[0]) && marked_cells.include?(arr_winner[1]) && marked_cells.include?(arr_winner[2])
        return true
      end
      false
    end
  end

  def available_pos?(pos)
    @official_board.free_cell?(pos)
  end

  def make_play(play_target, mark)
    @official_board.update_cell(play_target, mark)
  end

  def show_result
    %(#{@@game_result})
  end

end
