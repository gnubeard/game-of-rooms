#Attaches the coordinates of each room to their other attributes through the 
#easily accessible $facilityMap hash.
class Room
  def initialize( x, y, z, description, items, monster, fixtures )
    coords = [x, y, z]
    $facilityMap[coords] = [description, items, monster, fixtures]
  end
end
