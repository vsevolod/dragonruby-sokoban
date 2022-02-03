class Sokoban
  module Tiles
    class Box
      COLORS = {
        free: 'blue',
        broken: 'black',
        done: 'green'
      }.freeze

      attr_reader :x, :y, :state

      def initialize(x:, y:, state: nil)
        @x, @y = x, y
        @state = state || :free
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
