class Sokoban < GameTemplate
  ATTRIBUTES = %i[map level]

  attr_reader :hero, :boxes, :goals
  attr_accessor :finished

  def initialize
    super

    @hero = map.hero
    @boxes = map.boxes
    @goals = map.goals

    @finished = false
  end

  def finished?
    finished == true
  end

  ATTRIBUTES.each do |key|
    define_method key do
      config.send(key)
    end
  end
end
