class Sokoban
  module Events
    class HeroGoesUp < HeroGoesBase
      private

      def next_y
        game.hero.y - 1
      end

      def box_event
        Sokoban::Events::BoxGoesUp
      end
    end
  end
end
