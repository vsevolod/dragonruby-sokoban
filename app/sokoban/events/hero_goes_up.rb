class Sokoban
  module Events
    class HeroGoesUp < HeroGoesBase
      private

      def next_y
        game.hero.y - 1
      end
    end
  end
end
