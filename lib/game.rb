class Game
  INDICATORS = %w[health mana happiness fatigue money].freeze

  def initialize(character, actions_pool)
    @character = character
    @actions_pool = actions_pool
    @stack = []
  end

  def run
    until @character.dead?
      print_information
      value = IOAdapter.instance.input '[CHOOSE AN ACTION]:'
      next_command = @actions_pool.avaliable_actions(@character)[value]
      unless next_command.nil?
        @stack.push(@character.clone)
        next_command.execute(@character)
      end
      other_actions(value)
    end
    print_indicators
    IOAdapter.instance.output "\n[Hold on. Valera is dead. We are very sorry...]\n\n"
  end

  def other_actions(value)
    case value
    when 'z'
      from_stack = @stack.pop
      @character = from_stack unless from_stack.nil?
    when 's'
      SaveOrLoad.save(@character)
      IOAdapter.instance.output 'Saving was successful.'
    when 'l'
      SaveOrLoad.load(@character)
      IOAdapter.instance.output 'Download was successful.'
    end
  end

  def print_information
    print_indicators
    print_actions
  end

  def print_actions
    IOAdapter.instance.output "\n[ACTIONS]:"
    actions = @actions_pool.avaliable_actions(@character)
    actions.each { |key, value| IOAdapter.instance.output("[#{key}] - #{value.name} (#{value.description})") }
    IOAdapter.instance.output 'Enter "s" to save the data'
    IOAdapter.instance.output 'Enter "l" to load the data'
  end

  def print_indicators
    IOAdapter.instance.output "\n[PARAMETERS]:"
    INDICATORS.each { |param| IOAdapter.instance.output "[#{param}] : #{@character.send param}" }
  end
end