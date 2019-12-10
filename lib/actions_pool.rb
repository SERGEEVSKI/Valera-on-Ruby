class ActionsPool
  attr_accessor :actions

  def initialize(actions)
    @actions = actions
  end

  def avaliable_actions(character)
    @actions.select { |_key, value| value.valid?(character) }
  end
end
