class Sokoban
  module Events
    class TryWin
      attr_reader :game, :screen

      def initialize(screen:, game:)
        @game = game
        @screen = screen
      end

      def call
        return unless win?

        game.finished = true
        screen.static_solid_clear!
      end

      private

      def win?
        game.boxes.all?(&:done?)
      end
    end
  end
end
