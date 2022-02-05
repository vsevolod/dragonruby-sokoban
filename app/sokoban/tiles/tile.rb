class Sokoban
  module Tiles
    class Tile
      STATES = %i[empty wall]
      attr_reader :state, :box
      attr_accessor :goal

      def initialize(state, box: nil, goal: nil)
        @goal = goal
        @state = state
        @box = box
        box.tile = self if box
      end

      def box=(new_box)
        @box = new_box

        return unless new_box

        if goal
          new_box.done!
        else
          new_box.free!
        end
      end

      def draw(screen, **position)
        screen.static_solid(**position, **draw_args)
      end

      def draw_args
        case state
        when :empty
          { r: 255, g: 255, b: 255 }
        when :wall
          { r: 0, g: 0, b: 0 }
        end
      end
    end
  end
end
