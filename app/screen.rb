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
    @scale_x = @scale_y = [@scale_x, @scale_y].min
  end

  def show_hint(x=10, y=710)
    args.outputs.labels << [x, y, "r - restart level"]
    args.outputs.labels << [x, y-18, "u - undo move"]
    args.outputs.labels << [x, y-36, "n - next level"]
  end

  def add_label(x:, y:, text:)
    args.outputs.labels << [x, y, text]
  end

  def sprite(x:, y:, path:)
    args.outputs.sprites << {
      x: args.grid.left.shift_right(scale_x * x),
      y: args.grid.top.shift_down(scale_y * y),
      w: scale_x - 1,
      h: scale_y - 1,
      path: path
    }
  end

  def static_solid_clear!
    args.outputs.static_solids.clear
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
