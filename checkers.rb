#!/usr/bin/env ruby

require './colorize'
require './board'
require './pieces'
require './error'

class Checkers
  attr_accessor :turn


  #creates new game
  def initialize
    @board = Board.new
    @black_pieces = []
    @white_pieces = []
    create_pieces
  end

  # initializes starting pieces
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

  def get_input
    puts "Input coordinates as pairs in sequence (e.g. 5,3 3,5 1,7)."
    input = gets.chomp

    coords = []
    input.split(' ').each do |pair|

      pair_array = []
      pair.split(',').each do |num|
        pair_array << num.to_i
      end
      coords << pair_array
    end
    coords
  end

  def parse_coords(coords)
    coords.each_with_index do |pair, idx|
      next if idx == 0

      y2, x2 = pair
      y1, x1 = coords[idx - 1]

      if (y2 - y1).abs == 2 && (x2 - x1).abs == 2
        @board.perform_jump([y1, x1],[y2, x2])
      elsif (y2 - y1).abs == 1 && (x2 - x1).abs == 1
        @board.perform_slide([y1, x1],[y2, x2])
      else
        raise InvalidMoveError.new
        "Moves must be one space or two spaces away from previous move."
      end

    end
  end

  #loops through for user input
  def play
    @board.display
    while true

      begin
        coords = get_input
        parse_coords(coords)

      rescue ArgumentError => e
        puts "Could not execute all or part of move sequence."
        puts "Error was: #{e.message}"

      end

    end
  end

end




if __FILE__ == $PROGRAM_NAME
  newgame = Checkers.new
  newgame.play

end