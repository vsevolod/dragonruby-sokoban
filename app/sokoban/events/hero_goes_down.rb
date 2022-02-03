class Sokoban
  module Events
    class HeroGoesDown < HeroGoesBase
      private

      def next_y
        game.hero.y + 1
      end
    end
  end
end
