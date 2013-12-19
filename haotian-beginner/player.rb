class Player
  def initialize()
    @enemies = 4
  end
  def play_turn(warrior)
    puts "new turn"
    if not warrior.feel.empty?
        warrior.attack!
        if warrior.feel.empty?
          @enemies -= 1
          puts @enemies
        end
    else
      if warrior.health < 7 and @enemies > 0
        warrior.rest!
        return
      end
      warrior.walk!
    end
  end
end
