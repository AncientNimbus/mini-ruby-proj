# frozen_string_literal: true

# Chess module
module Chess
  # Generate an adjacency matrix for each chess piece types.
  # @param rules [Symbol]
  # @param board_size [Integer] default to 8 for Chessboard
  # @return [Array<Array<Integer>>]
  def moves_matrix(rules, board_size = 8)
    total_positions = board_size**2
    matrix = Array.new(total_positions) { Array.new(total_positions, 0) }

    (0...total_positions).each do |pos1|
      (0...total_positions).each do |pos2|
        next if pos1 == pos2 # skip same cell

        matrix[pos1][pos2] = 1 if valid_move?(pos1, pos2, board_size, rules)
      end
    end
    matrix
  end

  # Convert coordinate array to cell position.
  def to_pos(coord, board_size = 8)
    row, col = coord
    (row * board_size) + col
  end

  # Convert cell position to coordinate array.
  def to_coord(pos, board_size = 8)
    pos.divmod(board_size)
  end

  private

  # Validate move based on the provided conditions.s
  def valid_move?(pos1, pos2, board_size, rules)
    coord1 = to_coord(pos1, board_size)
    coord2 = to_coord(pos2, board_size)

    method(rules).call(coord1, coord2)
  end
end
