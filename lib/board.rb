# lib/board.rb
class Board
  attr_reader :cells, :plays_count

  def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    %(+ --- + --- + --- +
   #{@cells[0]}  |  #{@cells[1]}  |  #{@cells[2]}
+ --- + --- + --- +
   #{@cells[3]}  |  #{@cells[4]}  |  #{@cells[5]}
+ --- + --- + --- +
   #{@cells[6]}  |  #{@cells[7]}  |  #{@cells[8]}
+ --- + --- + --- +
    )
  end

  def update_cell(index, value)
    @cells[index.to_i - 1] = value
  end

  def free_cell?(index)
    return false if @cells[index - 1] == 'X' || @cells[index - 1] == '0'

    true
  end
end
