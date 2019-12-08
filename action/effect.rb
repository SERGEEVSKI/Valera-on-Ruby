class Action
  class Effect
    attr_accessor :parameter, :value

    def initialize(parameter:, value:)
      self.parameter = parameter
      self.value = value
    end

    def execute(character)
      new_value = character.send(parameter) + value
      character.send("#{parameter}=", new_value)
    end
  end
end