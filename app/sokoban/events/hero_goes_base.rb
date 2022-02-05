class Sokoban
  module Events
    class HeroGoesBase
      attr_reader :game, :reverse

      def initialize(game:, reverse: false)
        @game = game
        @reverse = reverse
      end

      def call
        return false unless available?

        push_to_history unless reverse
        game.hero.x = next_x
        game.hero.y = next_y
        true
      end

      private

      def available?
        return false if next_x < 1
        return false if next_y < 1
        return false unless next_tile

        if next_tile.box
          next_tile.state == :empty && box_event.new(game: game, box: next_tile.box).call
        else
          next_tile.state == :empty
        end
      end

      def next_x
        game.hero.x
      end

      def next_y
        game.hero.y
      end

      def next_tile
        @next_tile ||= game.map.tiles[next_y - 1][next_x - 1]
      end

      def push_to_history
        last_turn = game.history.last

        if !last_turn || last_turn.key?(:hero_event)
          game.history.push({hero_event: previous_event})
        else
          last_turn[:hero_event] = previous_event
        end
      end

      def box_event
        raise NotImplementedError
      end

      def previous_event
        raise NotImplementedError
      end
    end
  end
end
