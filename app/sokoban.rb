class Sokoban < GameTemplate
  ATTRIBUTES = %i[map]

  attr_reader :hero, :boxes, :goals

  def initialize
    super

    @hero = map.hero
    @boxes = map.boxes
    @goals = map.goals
  end

  ATTRIBUTES.each do |key|
    define_method key do
      config.send(key)
    end
  end
end
