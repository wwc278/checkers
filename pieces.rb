

class Piece
  attr_accessor :symbol, :color, :pos
  def initialize(color, pos)
    self.color = color
    self.symbol = (self.color == :white) ? "\u26aa" : "\u26ab"
  end

  # compiles valid slide moves for each piece

  # compiles valid jump moves for each piece

  # king and non-king attribute


end