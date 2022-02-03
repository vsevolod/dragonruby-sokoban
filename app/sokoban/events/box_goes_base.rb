class Sokoban
  module Events
    class BoxGoesBase
      attr_reader :game, :box

      def initialize(game:, box:)
        @game = game
        @box = box
      end

      def call
        return false unless available?

        box.x = next_x
        box.y = next_y
        box.tile = next_tile

        true
      end

      private

      def available?
        return false if next_x < 1
        return false if next_y < 1
        return false unless next_tile

        next_tile.box.nil? && next_tile.state == :empty
      end

      def next_x
        box.x
      end

      def next_y
        box.y
      end

      def next_tile
        @next_tile ||= game.map.tiles[next_y - 1][next_x - 1]
      end
    end
  end
end
