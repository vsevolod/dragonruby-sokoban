class Sokoban
  module Events
    class BoxGoesLeft < BoxGoesBase
      private

      def next_x
        box.x - 1
      end

      def previous_event
        Sokoban::Events::BoxGoesRight
      end
    end
  end
end
