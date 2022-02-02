class Screen
  attr_reader :args

  def initialize(args)
    @args = args
  end

  def show_fps(x=10, y=710)
    args.outputs.labels << [x, y, "FPS: #{args.gtk.current_framerate.round}"]
  end
end
