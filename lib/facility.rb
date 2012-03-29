# Each room is an array like this: [x, y, z, description, items, monster, traps]
Facility = [
  [0,0,0, "The sign says this is room one. There's a ladder leading to the ceiling.", "bottle", "troll", nil],
  [0,0,1, "This is room two. There's a trap door in the floor.", nil, "dragon", "endportal"],
  [0,0,2, "This is room three. There's a wolf head on the wall.", "can", nil, nil] 
  ]

#facilityMap is a hash containing all the rooms. Their xyz locations are 
#associated with an array containing the rest.
$facilityMap = {}

#Probably a really dumb way to do this, but these are whitelists of 
#allowed commands.  
$movementVars = %w[up down left right forward back]
$roomCommands = %w[use eat sleep fight look say take get remember where weapon life equip points]