class Sokoban
  module Events
    class TickDraw
      attr_reader :screen, :game

      def initialize(screen:, game:)
        @screen = screen
        @game = game
      end

      def call
        game.hero.draw(screen)
      end

      private

      def map
        game.map
      end
    end
  end
end
