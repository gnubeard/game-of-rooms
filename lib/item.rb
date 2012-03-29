#Controls item spawning in rooms. 
class Item
  attr_accessor :coordinates, :life
  def initialize( player )
    item = $facilityMap[player.coordinates][1]
    if item
      puts "There is a #{ item } here."
    else
      return true
    end
  end
end