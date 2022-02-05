def tick args
  init(args)

  @screen.tick(args)
  # @screen.show_fps

  if @game.finished?
    Sokoban::Events::FinishDraw.new(screen: @screen, game: @game).call

    # Next level
    if args.inputs.keyboard.keys[:down].any?
      @initial = nil
      @level += 1
    end
  else
    Sokoban::Events::TickDraw.new(screen: @screen, game: @game).call
    Sokoban::Events::TryWin.new(screen: @screen, game: @game).call

    Sokoban::Events::HeroGoesLeft.new(game: @game).call if args.inputs.keyboard.key_down.left
    Sokoban::Events::HeroGoesRight.new(game: @game).call if args.inputs.keyboard.key_down.right
    Sokoban::Events::HeroGoesUp.new(game: @game).call if args.inputs.keyboard.key_down.up
    Sokoban::Events::HeroGoesDown.new(game: @game).call if args.inputs.keyboard.key_down.down

    @initial = nil if args.inputs.keyboard.key_down.r
    Sokoban::Events::Undo.new(game: @game).call if args.inputs.keyboard.key_down.u
  end
end

def init(args)
  return if @initial
  @level ||= 1

  path = "data/map#{@level}.txt"
  data = args.gtk.read_file(path)

  if data
    @map = Sokoban::Map.new(data)
    @screen = Screen.new(map: @map, args: args)
    @game = Sokoban.new do |c|
      c.map = @map
      c.level = @level
    end

    Sokoban::Events::InitDraw.new(screen: @screen, game: @game).call
  end

  @initial = true
end
