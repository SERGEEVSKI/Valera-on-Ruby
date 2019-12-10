class Action
  class AddCond
    attr_accessor :conds, :effects

    def initialize(conds:, effects:)
      self.conds = conds
      self.effects = effects
    end

    def execute(character)
      return unless conds.inject(true) { |sum, cond| sum && cond.valid?(character) }

      (effects.map { |i| i.execute(character) }).flatten
    end
  end
end