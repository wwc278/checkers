

class Piece
  attr_accessor :symbol, :color, :pos, :status
  def initialize(color, pos)
    self.color = color
    self.symbol = (self.color == :white) ? "\u26aa" : "\u26ab"
    self.pos = pos
    self.status = :pawn
  end


  DELTA_S = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
  DELTA_J = [[-2, -2], [-2, 2], [2, -2], [2, 2]]
  # compiles valid slide moves for each piece
  def moves(delta) #use delta_s for sliding and delta_j for jumping
    move_arr = []

    delta.each do |dy, dx|
      move = [pos[0] + dy, pos[1] + dx]

      if in_bounds?(move)
        if status == :king || (color == :white && dy < 0) ||
          (color == :black && dy > 0)
          move_arr << move
        end
      end
    end

    move_arr
  end

  def sliding_moves
    moves(DELTA_S)
  end

  def jump_moves
    moves(DELTA_J)
  end

  def in_bounds?(coord)
    coord.all? {|x_or_y| x_or_y.between?(0,7)}
  end
  # compiles valid jump moves for each piece

  # king and non-king attribute


end