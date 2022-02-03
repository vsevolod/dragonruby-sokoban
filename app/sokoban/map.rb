# Legend
# '*' - wall
# ' ' - empty space
# 'h' - hero
# 'b' - box
# 'g' - goal

class Sokoban
  class Map
    attr_reader :width, :height,
      :tiles, :boxes, :goals, :hero

    def initialize(io)
      fill(io)

      @width = tiles.map(&:size).max + 1
      @height = tiles.size
    end

    private

    def fill(io)
      @tiles = []
      @boxes = []
      @goals = []

      io.each_line do |row|
        line = []
        @tiles.push(line)

        row.chars.each do |sym|
          x = line.size + 1
          y = @tiles.size

          state =
            case sym
            when '*'
              :wall
            when 'h'
              @hero = Tiles::Hero.new(x: x, y: y)
              :empty
            when 'b'
              @boxes.push(Tiles::Box.new(x: x, y: y))
              :empty
            when 'g'
              @goals.push(Tiles::Goal.new(x: x, y: y))
              :empty
            when "\n"
              next
            else
              :empty
            end

          line.push(Tiles::Tile.new(state))
        end
      end
    end
  end
end
