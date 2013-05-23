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
    @black_pieces = []
    @white_pieces = []
    create_pieces
    #@pieces = Pieces.new

  end

  def create_pieces
    (0..7).each do |id1|
      (0..7).each do |id2|

        next unless (id1 + id2) % 2 == 0

        if id1.between?(0,2)
          piece = Piece.new(:black, [id1, id2]) # create piece object
          @black_pieces << piece # add to array of black pieces
        elsif id1.between?(5,7)
          piece = Piece.new(:white, [id1, id2])
          @white_pieces << piece # add to array of black pieces
        end
        @board.checkers_board[id1][id2] = piece unless piece.nil?# put on board

      end
    end

  end

  def play
    @board.display
  end

end




if __FILE__ == $PROGRAM_NAME
  newgame = Checkers.new
  newgame.play

end