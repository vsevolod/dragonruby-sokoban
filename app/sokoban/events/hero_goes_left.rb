class Sokoban
  module Events
    class HeroGoesLeft < HeroGoesBase
      private

      def next_x
        game.hero.x - 1
      end

      def box_event
        Sokoban::Events::BoxGoesLeft
      end
    end
  end
end
