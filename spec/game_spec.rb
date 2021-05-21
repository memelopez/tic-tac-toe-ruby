# spec/board_spec.rb

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Game do
  let(:p1) { Player.new('Messi', 'X') }
  let(:p2) { Player.new('Cristiano', 'O') }
  let(:board) { Board.new }
  let(:game) { Game.new(p1, p2) }

  describe '#beginning_message' do
    context 'when game is about to start' do
      it 'returns a string with the beginning message' do
        expect(game.beginning_message).to eql(%(Great! We are all set.
#{p1.name} will play #{p1.mark}s and #{p2.name} will play #{p2.mark}s.\n
))
      end
    end
  end

  describe '#display_board' do
    context 'when printing board' do
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
  end

  describe '#whos_turn_player' do
    context "when asking who's turn it is" do
      it 'returns a player of class player' do
        expect(game.whos_turn_player).to eql(p1)
      end
    end
  end

  describe '#game_over?' do
    context 'when asking if game should be stopped' do
      it 'returns FALSE if the game has not finished' do
        expect(game.game_over?).to be_falsey
      end

      it 'returns TRUE when play_count >= 9 (DRAW)' do
        game.play_count = 9
        expect(game.game_over?).to be_truthy
      end

      it 'returns TRUE when a player has made a winning move' do
        game.game_over = true
        expect(game.game_over?).to be_truthy
      end
    end
  end

  describe '#winning_move?' do
    context 'when asking if the last move should finish the game' do
      it 'returns FALSE if a player does not have a winning combo' do
        expect(game.winning_move?([0])).to be_falsey
      end
      it 'returns TRUE if a player does have a winning combo in his plays' do
        expect(game.winning_move?([0, 1, 2])).to be_truthy
      end
    end
  end

  describe '#available_pos?' do
    context 'when verifying if a position is available' do
      it 'returns TRUE if a cell is avaible' do
        expect(game.available_pos?(1)).to be_truthy
      end
      it 'returns FALSE if a cell is not avaible' do
        game.make_play(1, 'X')
        expect(game.available_pos?(1)).to be_falsey
      end
    end
  end

  describe '#make_play' do
    context 'when making a play' do
      it 'returns the play count after updating the board and verifying if it is a winning move' do
        expect(game.make_play(0, 'X')).to eql(1)
      end
    end
  end

  describe '#show_result' do
    context 'when asking for the game result' do
      it 'returns a string with initial game result' do
        expect(game.show_result).to eql("It's a draw!")
      end
      it 'returns a string with player who just made a winning move' do
        game.make_play(1, 'X')
        game.make_play(4, '0')
        game.make_play(2, 'X')
        game.make_play(5, '0')
        game.make_play(3, 'X')
        expect(game.show_result).to eql("#{p1.name} wins!")
      end
    end
  end

  describe '#game2string' do
    context 'when asking for game information' do
      it 'returns a string with the variables of the game' do
        expect(game.game2string).to eql(%(------------- GAME -------------
    Player 1: #{p2.name}'#{p1.mark}' plays: #{p1.plays}
    Player 2: #{p2.name}'#{p2.mark}' plays: #{p2.plays}
    Play count: 0 and result: It's a draw!
    -----------------------------------))
      end
    end
  end
end
