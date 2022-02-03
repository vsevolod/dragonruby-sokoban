class Sokoban
  module Events
    class FinishDraw
      attr_reader :screen

      def initialize(screen:)
        @screen = screen
      end

      def call
        screen.add_label(x: 560, y: 400, text: 'Congratulations!')
      end
    end
  end
end
