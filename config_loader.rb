require 'yaml'
require 'open-uri'

Dir['./action/*.rb'].each { |file| require_relative file }

class ConfigLoader

  CONFIG_FILENAME = 'config.yml'.freeze

  def initialize(character, actions)
    @character = character
    @actions = actions
    load_configuration
  end

  private

  def load_configuration
    data = YAML.load_file(CONFIG_FILENAME)
    change_data data['initial'] if data.include?('initial')
    build_actions data['actions'] if data.include?('actions')
  end

  def change_data(data)
    data.each { |i| @character.send("#{i['parameter'].to_sym}=", + i['value']) }
  end

  def build_actions(data)
    i = 1
    data.each do |act|
      new_act = Action.new name: act['name'],
                           description: act['description'],
                           effects: act['effects'].map { |eff| build_effect(eff) },
                           conds: build_condition(act),
                           add_conds: build_add_condition(act)
      @actions.store(i.to_s, new_act)
      i += 1
    end
  end

  def build_condition(data)
    return [] if data['condition'].nil?

    data['condition'].map do |cond|
      Action::Cond.new parameter: cond['parameter'],
                       operator: cond['operator'],
                       value: cond['value']
    end
  end

  def build_effect(data)
    Action::Effect.new parameter: data['parameter'],
                       value: data['value']
  end

  def build_add_condition(data)
    return [] if data['additional_cond'].nil?

    data['additional_cond'].map do |add_cond|
      Action::AddCond.new conds: build_condition(add_cond),
                          effects: add_cond['effects'].map { |eff| build_effect(eff) }
    end
  end

end