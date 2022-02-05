class Sokoban
  module Events
    class BoxGoesBase
      attr_reader :game, :box, :reverse

      def initialize(game:, box:, reverse: false)
        @game = game
        @box = box
        @reverse = reverse
      end

      def call
        return false unless available?

        game.history.push({box_event: previous_event, box: box}) unless reverse
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
