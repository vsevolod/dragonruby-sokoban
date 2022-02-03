class Sokoban
  module Events
    class InitDraw
      attr_reader :screen, :game

      def initialize(screen:, game:)
        @screen = screen
        @game = game
      end

      def call
        game.map.tiles.map_2d do |y, x, tile|
          tile.draw(screen, x: x+1, y: y+1)
        end
      end

      private

      def map
        game.map
      end
    end
  end
end
