def tick args
  init(args)

  @screen.tick(args)
  @screen.show_fps

  Sokoban::Events::TickDraw.new(screen: @screen, game: @game).call

  Sokoban::Events::HeroGoesLeft.new(game: @game).call if args.inputs.keyboard.key_down.left
  Sokoban::Events::HeroGoesRight.new(game: @game).call if args.inputs.keyboard.key_down.right
  Sokoban::Events::HeroGoesUp.new(game: @game).call if args.inputs.keyboard.key_down.up
  Sokoban::Events::HeroGoesDown.new(game: @game).call if args.inputs.keyboard.key_down.down
end

def init(args)
  return if @initial

  @map = Sokoban::Map.new(File.read('./mygame/data/map1.txt'))
  @screen = Screen.new(map: @map, args: args)
  @game = Sokoban.new do |c|
    c.map = @map
  end

  Sokoban::Events::InitDraw.new(screen: @screen, game: @game).call

  @initial = true
end
