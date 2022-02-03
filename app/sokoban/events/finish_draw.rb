class Sokoban
  module Events
    class FinishDraw
      attr_reader :screen, :game

      def initialize(screen:, game:)
        @screen = screen
        @game = game
      end

      def call
        screen.add_label(x: 560, y: 400, text: "Congratulations! Level ##{game.level}")
      end
    end
  end
end
