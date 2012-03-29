#All players are Inmates. This class is where I put things players have or do,
#like movement, commands, life, coordinates, inventory, points, and your weapon.
class Inmate
  
  attr_accessor :weapon, :life, :coordinates, :inventory, :points
  
  #Sets starting conditions for the player.
  def initialize
    @points = 0
    @zCoord = 0
    @yCoord = 0
    @xCoord = 0
    @coordinates = [@xCoord, @yCoord, @zCoord]
    @inventory = []
    @weapon = [ "a gun" , 10 ]
    @life = 100
  end

  #The Inmate.doCommand method executes the player's non-movement commands.
  def doCommand( command )
    #The main loop sends an array here composed of the player's input broken 
    #into strings for each word. First, doCommand checks to see if it's a movement
    #variable, and if it is, sends it to the player movement method.
    if $movementVars.include? command[0]
      return move(command[0])
    else
      #I've heard nesting conditionals is bad form. Whoops. Mark this one
      #as a prime location for cleanup.
      
      case command[0]        
      when "help"
        puts "You can only use the following commands."
        puts $movementVars, $roomCommands  
      when "points"
        puts "You have #{ @points } points."
      when "look"
        puts $facilityMap[@coordinates][0]
      when "where"
        puts @coordinates.to_s
      when "use"
        
        #This part is buggy.
        if @inventory.include? command[1]
          puts "You decide to use the #{ command[1] }."
          #Having checked to make sure the item is in the player's inventory,
          #the Inmate.use method will execute whatever process that inventory
          #object can do.
          return use( command[1] )
        else
          #Ain't I a stinker. 
          puts "Use what?"
        end
        
        #Proof of concept for synonyms. I'll implement more later.
      when "take"
        return doCommand(["get", command[1]])
        
        #Remember that commands enter the hash as an array [command[1], command[2]] 
      when "get"
        item = command[1]
        if $facilityMap[@coordinates][1] == item
          puts "You got the #{ item }!"
          @inventory << $facilityMap[@coordinates][1]
          $facilityMap[@coordinates][1] = nil
        else
           puts "Get what?"
        end
        
        #Prints player's life
      when "life"
        puts @life
        
        
       #Prints inventory
      when "inventory"
        if @inventory == []
          puts "Your pockets are empty."
        else
          print "You have: \n" 
          @inventory.each { |item| print item + " "; }
          puts " "
        end       
        
        
      #The weapon array contains two objects: a string (the weapon's name) and an integer (how much damage it does.)
      when "weapon"
        puts "You have #{ @weapon[0]} which does #{ @weapon[1] } damage."
      
      else
        puts "I don't know what you're trying to say."
      end
    end
  end 
    
  #player movement system.checks to see if there's a room and if there is, alters coordinates accordingly.
  #TODO prettify if possible. 

  def move( direction )
    disposablexCoord = @xCoord
    disposableyCoord = @yCoord
    disposablezCoord = @zCoord
    axes = {"up" => "disposablezCoord += 1", "down" => "disposablezCoord -= 1",
            "right" => "disposablexCoord += 1", "left" => "disposablexCoord -= 1",
            "forward" => "disposableyCoord += 1", "back" => "disposableyCoord -= 1"}
    eval axes[direction]  
    disposableCoords = [disposablexCoord, disposableyCoord, disposablezCoord]
  
        if $facilityMap.key?(disposableCoords)
          @xCoord = disposablexCoord
          @yCoord = disposableyCoord
          @zCoord = disposablezCoord
          @coordinates = [@xCoord, @yCoord, @zCoord]
          puts "The door opens easily."
        else
          puts "You can't go #{ direction } here."
        end
    end

    def use( item )
      case item
      when "can"
        @inventory.delete "can"
        puts "You eat the beans and feel refreshed."
        puts "Life = 100"
        @life = 100
      when "laser"
        @inventory.delete "laser"
        puts "You equip the laser. It does lots more damage."
        @weapon = ["a laser", 20]
        @laserVersion = 1
      when "charger"
        if @weapon[0] == "a laser"
          puts "You increase the power of your laser by 10!"
          @weapon[1] += 10
          @laserVersion += 1
          puts "Laser level #{ @laserVersion}!"
          @inventory.delete "charger"
        else
          puts "You need a laser first!"
      end
      when "bottle"
        if $facilityMap[coordinates][3] == "endportal"
          puts "You explode into a shower of #{ @points } points!"
          abort "You win!"
        else
          puts "You can't use the bottle yet!"
        end
      end
    end
  end
