# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#print_board' do
    context 'when printing the board' do
      it 'returns a string that represents the board' do
        expect(board.print_board).to eql(%(+ --- + --- + --- +
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

  describe '#update_cell' do
    context 'when marking a cel in the board' do
      it "asigns a value to board's array" do
        expect(board.update_cell(1, 'X')).to eql('X')
      end
    end
  end

  describe '#free_cell?' do
    context 'when verifying if a cell is available' do
      it 'returns true when a cell is available' do
        expect(board.free_cell?(1)).to be_truthy
      end
      it 'returns false when a certain cell is already marked' do
        board.update_cell(1, 'X')
        expect(board.free_cell?(1)).to be_falsey
      end
    end
  end
end
