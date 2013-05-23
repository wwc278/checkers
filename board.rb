

class Board
  attr_accessor :checkers_board
  # initializes board with grid pattern
  def initialize
    create_board
  end

  def create_board
    self.checkers_board = Array.new(8) {Array.new(8) {" "}}
  end

  def display
    puts "  +----+----+----+----+----+----+----+----+"
    self.checkers_board.each_with_index do |row, idx|
      row_string = ""

      row.each do |el|
        el = ((el.class == String) ? el : el.symbol)
        row_string << el
      end

      puts "#{idx} | " + row_string.split('').join("  | ") + "  |"
      puts "  +----+----+----+----+----+----+----+----+"
    end
    puts "     0    1    2    3    4    5    6    7  "
  end

  def piece_at(pos)
    @checkers_board[pos[0]][pos[1]]
  end

  def put_at(pos, piece)
    @checkers_board[pos[0]][pos[1]] = piece
  end

  def occupied?(pos)
    @checkers_board[pos[0]][pos[1]].class == Piece
  end

  def opp_occupied?(start_pos, mid_pos)
    own_piece = @checkers_board[start_pos[0]][start_pos[1]]
    unknown_piece = @checkers_board[mid_pos[0]][mid_pos[1]]
    unknown_piece.class == Piece && own_piece.color != unknown_piece.color

  end

  def perform_slide(start_pos, end_pos)
    x1, y1 = start_pos
    x2, y2 = end_pos

    raise InvalidMoveError.new "End position occupied." if occupied?(end_pos)
    move(start_pos, end_pos)
  end

  def perform_jump(start_pos, end_pos)
    y1, x1 = start_pos
    y2, x2 = end_pos
    mid_pos = [y1 - (y1 - y2) / 2, x1 - (x1 - x2) / 2]

    if opp_occupied?(start_pos, mid_pos)
      put_at(mid_pos, " ") # set eaten piece to " " on board
      move(start_pos, end_pos)
    else
      raise InvalidMoveError.new "No opponent to jump."
    end
  end

  def move(start_pos, end_pos)
    piece = piece_at(start_pos)
    put_at(end_pos, piece)
    put_at(start_pos, " ")
    piece.pos = end_pos

    if (piece.pos[0] == 0 && piece.color == :white) ||
      (piece.pos[0] == 7 && piece.color == :black)

      piece.status = :king
      piece.symbol = "\u2606" if piece.color == :white
      piece.symbol = "\u2605" if piece.color == :black
    end
    display
  end


  # valid_move_seq?

  # perform_moves!
  # => performs moves one by one and should not try to restore the board if part of move sequence is invalid

  # perform_slide

  # perform_jump, should remove jumped piece from board

  # raise InvalidMoveError when performing moves

end