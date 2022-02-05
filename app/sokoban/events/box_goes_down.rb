class Sokoban
  module Events
    class BoxGoesDown < BoxGoesBase
      private

      def next_y
        box.y + 1
      end

      def previous_event
        Sokoban::Events::BoxGoesUp
      end
    end
  end
end
