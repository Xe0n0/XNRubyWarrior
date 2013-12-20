class Player

  def initialize()
    @last_action = :safe
    @health = 20
  end

  def play_turn(warrior)

    if not warrior.feel.empty?

        warrior.attack!
        @last_action = :attack

    else

      if @health > warrior.health
        warrior.walk!
      else

        if warrior.health <= 12
          warrior.rest!
        else
          warrior.walk!
        end

      end

    end

    @health = warrior.health
  end
end
