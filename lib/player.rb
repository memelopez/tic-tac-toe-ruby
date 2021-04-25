# lib/player.rb
class Player
  attr_reader :name, :mark
  attr_accessor :plays

  def initialize(name, mark)
    @name = name
    @mark = mark
    @plays = []
  end

  def plyr2string
    %(Player #{@name} marks #{@mark} plays: #{@plays})
  end
end
