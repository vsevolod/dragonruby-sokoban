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

          tile =
            case sym
            when '*'
              Tiles::Tile.new(:wall)
            when 'h'
              @hero = Tiles::Hero.new(x: x, y: y)

              Tiles::Tile.new(:empty)
            when 'b'
              box = Tiles::Box.new(x: x, y: y)
              @boxes.push(box)

              Tiles::Tile.new(:empty, box: box)
            when 'g'
              goal = Tiles::Goal.new(x: x, y: y)
              @goals.push(goal)

              Tiles::Tile.new(:empty, goal: goal)
            when "\n"
              next
            else
              Tiles::Tile.new(:empty)
            end

          line.push(tile)
        end
      end
    end
  end
end
