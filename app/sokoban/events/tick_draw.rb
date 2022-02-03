class Sokoban
  module Events
    class TickDraw
      attr_reader :screen, :game

      def initialize(screen:, game:)
        @screen = screen
        @game = game
      end

      def call
        game.goals.each { |box| box.draw(screen) }
        game.hero.draw(screen)
        game.boxes.each { |box| box.draw(screen) }
      end

      private

      def map
        game.map
      end
    end
  end
end
