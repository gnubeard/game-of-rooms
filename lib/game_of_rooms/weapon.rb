class GameOfRooms
  class Weapon
    attr_reader :name, :damage
    def initialize(name, damage)
      @name = name
      @damage = damage
    end

    def attack(target)
      target.life -= @damage
    end
  end
end
