class Sokoban
  module Tiles
    class Tile
      STATES = %i[empty wall]
      attr_reader :state

      def initialize(state)
        @state = state
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
