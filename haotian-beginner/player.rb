class Player

  def initialize()
    @last_action = :safe
    @health = 20
    @ene = 3
    @direction = :forward
  end

  def play_turn(warrior)
    if warrior.feel(@direction).wall?
      @direction = :backward
    end

    if not warrior.feel(@direction).empty?
        if warrior.feel(@direction).captive?
          warrior.rescue!(@direction)
        else
          warrior.attack!(@direction)
          @last_action = :attack
        end

    else

      if @last_action == :attack

        @last_action = :safe
        @ene -= 1

      end

      if @health > warrior.health and warrior.health < 14
        if @direction == :forward
          warrior.walk! :backward
        else
          warrior.walk! :forward
        end
      elsif  @ene <= 0 or warrior.health >= 20 or @health > warrior.health
        warrior.walk!(@direction)
      else
        warrior.rest!
      end

    end

    @health = warrior.health
  end
end
