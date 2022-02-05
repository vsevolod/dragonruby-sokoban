class Sokoban
  module Events
    class Undo
      attr_reader :game, :event

      def initialize(game:)
        @game = game
      end

      def call
        last_turn = game.history.pop
        return unless last_turn

        undo_hero(last_turn[:hero_event])
        undo_box(last_turn[:box_event], last_turn[:box])
      end

      private

      def undo_hero(hero_event)
        hero_event.new(game: game, reverse: true).call
      end

      def undo_box(box_event, box)
        return unless box_event

        box_event.new(game: game, box: box, reverse: true).call
      end
    end
  end
end
