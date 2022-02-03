class Sokoban
  module Events
    class BoxGoesRight < BoxGoesBase
      private

      def next_x
        box.x + 1
      end
    end
  end
end
