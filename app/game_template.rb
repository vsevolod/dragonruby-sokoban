class GameTemplate
  attr_reader :screen
  attr_reader :config

  def initialize(screen)
    @screen = screen
    @config = GameConfig.new(&block)
  end
end
