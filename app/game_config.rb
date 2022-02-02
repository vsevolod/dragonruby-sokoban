class GameConfig
  attr_reader :attributes

  def initialize(**attributes)
    @attributes = attributes

    if block_given?
      attributes.instance_eval(&block)
    end
  end
end
