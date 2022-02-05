class Sokoban
  module Events
    class HeroGoesDown < HeroGoesBase
      private

      def next_y
        game.hero.y + 1
      end

      def box_event
        Sokoban::Events::BoxGoesDown
      end

      def previous_event
        Sokoban::Events::HeroGoesUp
      end
    end
  end
end
