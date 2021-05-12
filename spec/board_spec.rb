# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe '#print_board' do
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
