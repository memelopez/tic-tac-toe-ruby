# lib/player.rb
# frozen_string_literal: false

# Class that represents each player
class Player
  attr_reader :name, :mark
  attr_accessor :plays

  def initialize(name, mark)
    @name = name
    @mark = mark
    @plays = []
  end

  def plyr2string
    %(Player :: #{@name} -- marks :: #{@mark} -- plays: #{@plays} --<< )
  end

  def add_play(pos)
    @plays.push(pos - 1)
  end
end
