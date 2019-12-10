require_relative './save_or_load.rb'

class Menu
  def initialize(character, actions)
    @character = character
    @game = Game.new(character, actions)
  end

  def beginning
    IOAdapter.instance.output "[WELCOME]\n
    '1' - Start new game\n
    '2' - Continue game\n"
    beginning = IOAdapter.instance.input "\n[CHOOSE THE SOLUTION]: "
    case beginning
    when '1'
      @game.run
    when '2'
      SaveOrLoad.load(@character)
      @game.run
    end
  end
end
