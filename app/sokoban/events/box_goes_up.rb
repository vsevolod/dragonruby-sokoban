class Sokoban
  module Events
    class BoxGoesUp < BoxGoesBase
      private

      def next_y
        box.y - 1
      end
    end
  end
end
