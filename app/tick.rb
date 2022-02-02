def tick args
  screen = Screen.new(args)
  screen.show_fps

  game = Sokoban.new(screen: screen) do |c|
    c.width = 10
    c.height = 20
  end

  game.draw_field
end
