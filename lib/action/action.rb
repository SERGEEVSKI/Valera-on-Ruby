class Action
  attr_accessor :name, :description, :effects, :conds, :add_conds

  def initialize(name:, description: '', conds:, effects:, add_conds: [])
    self.name = name
    self.description = description
    self.effects = effects
    self.conds = conds
    self.add_conds = add_conds
  end

  def valid?(character)
    conds.inject(true) { |sum, cond| sum && cond.valid?(character) }
  end

  def execute(character)
    return unless valid? character

    add_conds.map { |cond| cond.execute(character) }
    effects.map { |eff| eff.execute(character) }
  end
end