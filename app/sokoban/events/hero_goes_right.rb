class Sokoban
  module Events
    class HeroGoesRight < HeroGoesBase
      private

      def next_x
        game.hero.x + 1
      end
    end
  end
end
