# frozen_string_literal: true

require_relative 'move_matrix'

# Knight Travails Module
module KnightTravails
  # Piece class
  class Piece
    include Chess
    attr_reader :valid_moves

    def initialize(rules = :rules)
      @valid_moves = moves_matrix(rules)
    end

    # Find the fastest valid path from one coordinate to another.
    def moves(coord1, coord2)
      journey = [coord1, coord2]
      journey.each do |coord|
        case coord
        in [Integer => row, Integer => col] if row.between?(0, 7) && col.between?(0, 7)
          # Valid coordinate - skip
        else
          raise ArgumentError, 'Invalid coordinate format: expected [row, col] with values 0-7'
        end
      end

      pathfinder(*journey.map { |e| to_pos(e) })
    end

    private

    # Helper: Access the matrix via cell position.
    def pathfinder(pos1, pos2)
      queue = [[pos1, 0, []]]
      visited = Set[pos1]

      until queue.empty?
        current = queue.shift
        return format_result(*current) if current[0] == pos2

        explore_moves(*current, queue, visited)
      end
    end

    # Helper: Access each cell and explore all valid options.
    def explore_moves(cell_pos, move, path, queue, visited)
      valid_moves[cell_pos].each_with_index do |pos, idx|
        next unless pos == 1 && !visited.include?(idx)

        visited.add(idx)
        queue << [idx, move + 1, path + [cell_pos]]
      end
    end

    # Helper: Format data and print the shortest path from point A to point B.
    def format_result(cell_pos, move, path)
      path << cell_pos
      path.map! { |e| to_coord(e) }
      puts <<~OUTPUT
        You made it in #{move} #{move > 1 ? 'moves' : 'move'}!
        Here's your path:
        #{path.map(&:to_s).join(' → ')}
      OUTPUT
    end
  end

  # Knight class
  class Knight < Piece
    private

    # Define movement valid move pattern for Knight.
    def rules(coord1, coord2)
      r1, c1 = coord1
      r2, c2 = coord2

      ((r1 - r2).abs == 2 && (c1 - c2).abs == 1) || ((r1 - r2).abs == 1 && (c1 - c2).abs == 2)
    end
  end
end
