class Character
  attr_reader :health, :mana, :happiness, :fatigue, :money

  def initialize(health: 0, mana: 0, happiness: 0, fatigue: 0, money: 0)
    self.health = health
    self.mana = mana
    self.fatigue = fatigue
    self.happiness = happiness
    self.money = money
  end

  def dead?
    health <= 0 || happiness <= -10
  end

  def health=(value)
    @health = if value > 100
                100
              elsif value.negative?
                0
              else
                value
              end
  end

  def mana=(value)
    @mana = if value > 100
              100
            elsif value.negative?
              0
            else
              value
            end
  end

  def happiness=(value)
    @happiness = if value > 10
                   10
                 elsif value < -10
                   -10
                 else
                   value
                 end
  end

  def fatigue=(value)
    @fatigue = if value > 100
                 100
               elsif value.negative?
                 0
               else
                 value
               end
  end

  def money=(value)
    @money = value
  end
end
