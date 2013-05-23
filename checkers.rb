#!/usr/bin/env ruby

require './colorize'
require './board'
require './pieces'

class Checkers
  attr_accessor :turn
  #loops through for user input

  #creates new game
  def initialize
    @board = Board.new
    #@pieces = Pieces.new
  end

  def play
    @board.display
  end

end


















if __FILE__ == $PROGRAM_NAME
  newgame = Checkers.new
  newgame.play
end