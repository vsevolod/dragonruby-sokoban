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
          state =
            case sym
            when '*'
              :wall
            when 'h'
              @hero = Tiles::Hero.new(x: line.size + 1, y: sym.size + 1)
              :empty
            when "\n"
              next
            else
              :empty
            end

          line.push(Tiles::Tile.new(state))
        end
        #when 'b'
        #  @boxes.push(Box.new(x: sym.size, y: line: size)
        #when 'g'
        #  @goals.push(Goal.new(x: sym.size, y: line: size)
      end
    end
  end
end
