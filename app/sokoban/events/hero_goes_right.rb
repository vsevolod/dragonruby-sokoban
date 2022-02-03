class Sokoban
  module Events
    class HeroGoesRight < HeroGoesBase
      private

      def next_x
        game.hero.x + 1
      end

      def box_event
        Sokoban::Events::BoxGoesRight
      end
    end
  end
end
