# spec/board_spec.rb

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/Game'

describe Game do
  let(:p1) { Player.new('Messi', 'X') }
  let(:p2) { Player.new('Cristiano', 'O') }
  let(:game) { Game.new(p1, p2) }

  describe '#beginning_message' do
    it 'returns a string with the beginning message' do
      expect(game.beginning_message).to eql(%(Great! We are all set.
#{p1.name} will play #{p1.mark}s and #{p2.name} will play #{p2.mark}s.\n
))
    end
  end
end
