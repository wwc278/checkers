

class Piece
  attr_accessor :symbol, :color, :pos
  def initialize(color, pos)
    self.color = color
    self.symbol = (self.color == :white) ? "\u26aa" : "\u26ab"
    self.pos = pos
  end

  # compiles valid slide moves for each piece
  def slide_moves
    slide_arr = []
    king_moves = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    king_moves.each do |dy, dx|
      move = [pos[0] + dy, pos[1] + dx]
      slide_arr << move if in_bounds?(move)
    end
    slide_arr
  end

  def in_bounds?(coord)
    coord.all? {|x_or_y| x_or_y.between?(0,7)}
  end
  # compiles valid jump moves for each piece

  # king and non-king attribute


end