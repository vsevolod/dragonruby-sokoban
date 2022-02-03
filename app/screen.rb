class Screen
  attr_reader :args, :scale_x, :scale_y

  def initialize(map:, args:)
    @args = args

    setup_scale(map)
  end

  def tick(args)
    @args = args
  end

  def setup_scale(map)
    @scale_x = (args.grid.w / map.width).floor
    @scale_y = (args.grid.h / map.height).floor
  end

  def show_fps(x=10, y=710)
    args.outputs.labels << [x, y, "FPS: #{args.gtk.current_framerate.round}"]
  end

  def sprite(x:, y:, path:)
    a = {
      x: args.grid.left.shift_right(scale_x * x),
      y: args.grid.top.shift_down(scale_y * y),
      w: scale_x - 1,
      h: scale_y - 1,
      path: path
    }
    args.outputs.sprites << a
  end

  def static_solid(x:, y:, r:, g:, b:)
    args.outputs.static_solids << [
      x: args.grid.left.shift_right(scale_x * x),
      y: args.grid.top.shift_down(scale_y * y),
      w: scale_x,
      h: scale_y,
      r: r,
      g: g,
      b: b
    ]
  end
end
