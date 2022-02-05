class Sokoban
  module Events
    class BoxGoesUp < BoxGoesBase
      private

      def next_y
        box.y - 1
      end

      def previous_event
        Sokoban::Events::BoxGoesDown
      end
    end
  end
end
