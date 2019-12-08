class Action
  class Cond
    attr_accessor :parameter, :operator, :value

    def initialize(parameter:, operator:, value:)
      self.parameter = parameter
      self.operator = operator
      self.value = value
    end

    def valid?(character)
      actual_value = character.send parameter
      actual_value.send operator, value
    end
  end
end