class Monster
  
  attr_accessor :coordinates, :weapon, :life, :points
  
  def initialize( player )
    @monsterKind = $facilityMap[player.coordinates][2]
      if @monsterKind
        return spawn
      end
  end
  
  def spawn    
    case @monsterKind
    when "dragon"
      @monsterLife = 30
      @monsterAttack = 10
      roll = rand(2) 
      if roll == 0
        @drop = "can"
      else
        @drop = "charger"
      spawnProb = 3
      end
    when "troll"
      @monsterLife = 15
      @monsterAttack = 20
      roll = rand(2)
      if roll == 0
        @drop = "gold"
      else
        @drop = "laser"
      spawnProb = 10
      end
    else
      raise Error "Nonexistent monster!"
    end
    if @monsterKind && rand(spawnProb) == 0
      puts "A terrible #{ @monsterKind } appears!"
      puts "Will you fight him or run?!"
      puts "> "
      input = gets.chomp
      if $movementVars.include? input
        puts "You escaped!"
        player.move(input)
      else
        return fight player
      end
    else
      return true
    end
  end

  def fight( player )
    #The fight is a loop that runs till one of you is dead.
    while @monsterLife > 0
      puts "You duke it out and stuff."
      player.life -= @monsterAttack
      puts "The #{ @monsterKind } attacks for #{ @monsterAttack } damage!"
      if player.life > 0
        @monsterLife =- player.weapon[1]
        puts "You attack the #{ @monsterKind } with #{ player.weapon[0] } for #{ player.weapon[1]} damage!"
      else
        abort "You died like an asshole."
        puts "You had #{ player.points } points."
        break
      end
      
      #Here's the points formula, open to change.
    points = -10 * ( @monsterLife * @monsterAttack ) / player.life
    puts "You killed the #{ @monsterKind }!"
    puts "You got #{ points } points!"
    player.points += points
    player.inventory << @drop
    puts "You got a #{ @drop }!"
    end
  end
end  
