class Sokoban
  module Tiles
    class Hero
      attr_reader :x, :y

      def initialize(x:, y:)
        @x, @y = x, y
      end

      def draw(screen)
        screen.sprite(
          x: x,
          y: y,
          path: 'sprites/misc/dragon-0.png'
        )
      end
    end
  end
end
