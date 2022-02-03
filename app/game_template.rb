class GameTemplate
  attr_reader :config

  def initialize(&block)
    @config = GameConfig.new(self.class.const_get(:ATTRIBUTES), &block)
  end

  def init_draw(screen)
    raise NotImplementedError
  end
end
