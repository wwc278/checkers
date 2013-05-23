

class Board
  attr_accessor :checkers_board
  # initializes board with colorized grid pattern
  def initialize
    create_board
  end

  def create_board
    self.checkers_board = Array.new(8) {Array.new(8) {}}
  end

  def display
    puts "+----+----+----+----+----+----+----+----+"
    self.checkers_board.each do |row|
      puts "|  " + row.join("  |  ") + "  |"
      puts "+----+----+----+----+----+----+----+----+"
    end
  end

  # initializes starting pieces

  # displays board with color and shading

  # valid_move_seq?

  # perform_moves!
  # => performs moves one by one and should not try to restore the board if part of move sequence is invalid

  # perform_slide

  # perform_jump, should remove jumped piece from board

  # raise InvalidMoveError when performing moves

end