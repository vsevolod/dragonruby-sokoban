class Sokoban
  module Events
    class BoxGoesLeft < BoxGoesBase
      private

      def next_x
        box.x - 1
      end
    end
  end
end
