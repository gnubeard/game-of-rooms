require 'facility'
require 'room'
require 'inmate'
require 'monster'
require 'item'
require 'fixture'

# Sometimes you don't want to run the "main" function -- e.g. when a file is `require`d.
# Let's only run this script when it's executed directly.
if __FILE__ == $0
  #Setting up for the main loop. Gotta have a player, and the Facility constant must be loaded
  #into memory as its constituent rooms.
  player = Inmate.new
  Facility.each{ |x, y, z, desc, items, monsters, traps|
  Room.new(x, y, z, desc, items, monsters, traps)}
  puts "You wake up in a cold white room."

  #The main loop. Pretty simple: First it checks to see if there's an item. Then it rolls to spawn
  #a monster. Finally, it takes input from the player, which it splits up and parcels into the
  #Inmate.doCommand method.
  while true
    Item.new( player)
    Monster.new( player )
    print "> "
    input = gets.chomp.downcase.split(" ").to_a  
    player.doCommand(input)
  end
end

#This crime against code was written by Robert Gryfft.
#CC BY-SA 3.0
#http://creativecommons.org/licenses/by-sa/3.0/
