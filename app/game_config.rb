class GameConfig
  attr_reader :attributes

  def initialize(keys)
    init_attributes(keys)

    yield(self) if block_given?
  end

  private

  def init_attributes(keys)
    @attributes = {}

    keys.each do |key|
      define_singleton_method(key) do
        @attributes[key.to_sym]
      end

      define_singleton_method("#{key}=") do |value|
        @attributes[key.to_sym] = value
      end
    end
  end
end
