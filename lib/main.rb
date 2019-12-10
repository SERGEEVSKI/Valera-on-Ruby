require_relative 'character.rb'
require_relative 'config_loader.rb'
require_relative 'menu.rb'
require_relative 'actions_pool.rb'
require_relative 'io_adapter.rb'
require_relative 'game.rb'

actions = {}

character = Character.new
ConfigLoader.new(character, actions)
actions_pool = ActionsPool.new(actions)
Menu.new(character, actions_pool).beginning
