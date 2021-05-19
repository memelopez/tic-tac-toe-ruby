# spec/player_spec.rb

require_relative '../lib/player'

describe Player do
  let(:plyr1) { Player.new('Leo Messi', 'X') }

  describe '#plyr2string' do
    it 'returns a string with the information of the player' do
      expect(plyr1.plyr2string).to eql('Player :: Leo Messi -- marks :: X -- plays: [] --<< ')
    end
  end

  describe '#add_play' do
    it 'returns an array with the positions the player has marked' do
      expect(plyr1.add_play(1)).to eql([0])
    end
  end
end
