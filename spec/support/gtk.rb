class GTK
  def current_framerate
    59.21
  end

  class Args
    class Grid
      def w
        1024
      end

      def h
        768
      end
    end

    class Output
      def labels
        @labels ||= []
      end
    end

    attr_reader :gtk, :outputs, :grid

    def initialize
      @gtk = GTK.new
      @outputs = Output.new
      @grid = Grid.new
    end
  end
end
