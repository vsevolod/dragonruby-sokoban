class Sokoban
  module Tiles
    class Box
      COLORS = {
        free: 'blue',
        done: 'green'
      }.freeze

      attr_accessor :x, :y
      attr_reader :tile, :state

      def initialize(x:, y:, state: nil)
        @x, @y = x, y
        @state = state || :free
      end

      def free!
        @state = :free
      end

      def done!
        @state = :done
      end

      def done?
        @state == :done
      end

      def tile=(new_tile)
        tile.box = nil if tile

        new_tile.box = self
        @tile = new_tile
      end

      def draw(screen)
        screen.sprite(
          x: x,
          y: y,
          path: "sprites/square/#{color}.png"
        )
      end

      private

      def color
        COLORS[state]
      end
    end
  end
end
