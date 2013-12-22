class Player

  def initialize()
    @last_action = :safe
    @health = 20
    @ene = 3
  end

  def play_turn(warrior)

    if not warrior.feel.empty?
        if warrior.feel.captive?
          warrior.rescue!
        else
          warrior.attack!
          @last_action = :attack
        end

    else

      if @last_action == :attack

        @last_action = :safe
        @ene -= 1

      end

      if @health > warrior.health or @ene <= 0 or warrior.health > 12
        warrior.walk!
      else
        warrior.rest!
      end

    end

    @health = warrior.health
  end
end
