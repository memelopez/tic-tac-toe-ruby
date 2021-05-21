# spec/player_spec.rb

require_relative '../lib/player'

describe Player do
  let(:plyr1) { Player.new('Leo Messi', 'X') }

  describe '#plyr2string' do
    context "when asking for player's info" do
      it "returns a string with player's name and mark" do
        expect(plyr1.plyr2string).to eql('Player :: Leo Messi -- marks :: X -- plays: [] --<< ')
      end
    end
  end

  describe '#add_play' do
    context 'when adding a position that player marked' do
      it 'returns an array with the positions the player has marked' do
        expect(plyr1.add_play(1)).to eql([0])
      end
    end
  end
end
