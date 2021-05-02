# lib/board.rb
# rubocop:disable Layout/LineLength

require_relative '../lib/player'
require_relative '../lib/board'

class Game
  WIN_COMBINATION = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]].freeze

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @official_board = Board.new
    @game_result = "It's a draw!"
    @play_count = 0
    @game_over = false
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
    return @player_one if @play_count.even?

    return @player_two if @play_count.odd?
  end

  def game_over?
    if @play_count >= 9
      true
    else
      @game_over
    end
  end

  def winning_move?(marked_cells)
    WIN_COMBINATION.each do |arr_winner|
      if marked_cells.include?(arr_winner[0]) && marked_cells.include?(arr_winner[1]) && marked_cells.include?(arr_winner[2])
        return true
      end
    end
    false
  end

  def available_pos?(pos)
    @official_board.free_cell?(pos)
  end

  def make_play(play_target, mark)
    @official_board.update_cell(play_target, mark)
    whos_turn_player.add_play(play_target)
    if winning_move?(whos_turn_player.plays)
      @game_over = true
      @game_result = "#{whos_turn_player.name} wins!"
    end
    @play_count += 1
  end

  def show_result
    @game_result.to_s
  end

  def game2string
    %(------------- GAME -------------
    Player 1: #{@player_two.name}'#{@player_one.mark}' plays: #{@player_one.plays}
    Player 2: #{@player_two.name}'#{@player_two.mark}' plays: #{@player_two.plays}
    Play count: #{@play_count} and result: #{@game_result}
    -----------------------------------)
  end
end
# rubocop:enable Layout/LineLength
