class Sokoban
  module Events
    class HeroGoesLeft < HeroGoesBase
      private

      def next_x
        game.hero.x - 1
      end
    end
  end
end
