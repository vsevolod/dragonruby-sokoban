class Sokoban
  module Events
    class HeroGoesBase
      attr_reader :game

      def initialize(game:)
        @game = game
      end

      def call
        return false unless available?

        game.hero.x = next_x
        game.hero.y = next_y
        true
      end

      private

      def available?
        return false if next_x < 1
        return false if next_y < 1
        return false unless next_tile

        if next_tile.box
          next_tile.state == :empty && box_event.new(game: game, box: next_tile.box).call
        else
          next_tile.state == :empty
        end
      end

      def next_x
        game.hero.x
      end

      def next_y
        game.hero.y
      end

      def next_tile
        @next_tile ||= game.map.tiles[next_y - 1][next_x - 1]
      end

      def box_event
        raise NotImplementedError
      end
    end
  end
end
