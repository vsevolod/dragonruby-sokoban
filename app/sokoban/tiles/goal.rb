class Sokoban
  module Tiles
    class Goal
      attr_reader :x, :y

      def initialize(x:, y:)
        @x, @y = x, y
      end

      def draw(screen)
        screen.sprite(
          x: x,
          y: y,
          path: "sprites/circle/blue.png"
        )
      end
    end
  end
end
