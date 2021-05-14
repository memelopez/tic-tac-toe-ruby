# spec/board_spec.rb

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/Game'

describe Game do
  let(:p1) { Player.new('Messi', 'X') }
  let(:p2) { Player.new('Cristiano', 'O') }
  let(:board) { Board.new }
  let(:game) { Game.new(p1, p2) }

  describe '#beginning_message' do
    it 'returns a string with the beginning message' do
      expect(game.beginning_message).to eql(%(Great! We are all set.
#{p1.name} will play #{p1.mark}s and #{p2.name} will play #{p2.mark}s.\n
))
    end
  end

  describe '#display_board' do
    it 'returns a string that represents the board' do
      expect(game.display_board).to eql(%(+ --- + --- + --- +
   #{board.cells[0]}  |  #{board.cells[1]}  |  #{board.cells[2]}
+ --- + --- + --- +
   #{board.cells[3]}  |  #{board.cells[4]}  |  #{board.cells[5]}
+ --- + --- + --- +
   #{board.cells[6]}  |  #{board.cells[7]}  |  #{board.cells[8]}
+ --- + --- + --- +
    ))
    end
  end

  describe '#whos_turn_player' do
    it 'returns a player of class player' do
      expect(game.whos_turn_player).to eql(p1)
    end
  end

  describe '#game_over?' do
    it 'returns boolean value if the game has finished' do
      expect(game.game_over?).to be(true).or be(false)
    end
  end

  describe '#winning_move?' do
    it 'returns boolean value verifying if last move is a winning move' do
      expect(game.winning_move?([0])).to be(true).or be(false)
    end
  end

  describe '#available_pos?' do
    it 'returns boolean value depending if position is available' do
      expect(game.available_pos?(0)).to be(true).or be(false)
    end
  end

  describe '#make_play' do
    it 'returns the play count after updating the board and verifying if it is a winning move' do
      expect(game.make_play(0, 'X')).to eql(1)
    end
  end

  describe '#show_result' do
    it 'returns a string with the game result' do
      expect(game.show_result).to eql("It's a draw!")
    end
  end

  describe '#game2string' do
    it 'returns a string with the variables of the game' do
      expect(game.game2string).to eql(%(------------- GAME -------------
    Player 1: #{p2.name}'#{p1.mark}' plays: #{p1.plays}
    Player 2: #{p2.name}'#{p2.mark}' plays: #{p2.plays}
    Play count: 0 and result: It's a draw!
    -----------------------------------))
    end
  end
end
