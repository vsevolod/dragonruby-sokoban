class Sokoban
  module Events
    class HeroGoesBase
      attr_reader :game

      def initialize(game:)
        @game = game
      end

      def call
        return unless available?

        game.hero.x = next_x
        game.hero.y = next_y
        puts "#{game.hero.x}:#{game.hero.y}"
      end

      private

      def available?
        return false if next_x < 1
        return false if next_y < 1

        tile = game.map.tiles[next_y - 1][next_x - 1]
        return false unless tile

        tile.state == :empty
      end

      def next_x
        game.hero.x
      end

      def next_y
        game.hero.y
      end
    end
  end
end
