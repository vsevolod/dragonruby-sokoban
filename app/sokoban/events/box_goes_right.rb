class Sokoban
  module Events
    class BoxGoesRight < BoxGoesBase
      private

      def next_x
        box.x + 1
      end

      def previous_event
        Sokoban::Events::BoxGoesLeft
      end
    end
  end
end
