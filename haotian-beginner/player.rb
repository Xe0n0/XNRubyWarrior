class Player

  def initialize()
    @enemies = 4
    @last_action = :safe
  end

  def play_turn(warrior)

    if not warrior.feel.empty?
        warrior.attack!
        @last_action = :attack
    else

      if @last_action == :attack
        @enemies -= 1
        @last_action = :safe
      end

      if warrior.health < 7 and @enemies > 0
        warrior.rest!
        return
      end

      warrior.walk!

    end
  end
end
