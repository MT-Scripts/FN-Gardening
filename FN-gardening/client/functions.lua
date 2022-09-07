QBCore = exports['qb-core']:GetCoreObject()
locations = {
  [1] = {
    coords = vector3(-529.02, -201.53, 37.65), 
    length = 0.6,
    width = 2.8,
    heading = 30
  },
  [2] = {
    coords = vector3(-527.45, -202.06, 37.65), 
    length = 0.6,
    width = 2.4,
    heading = 30
  },
  [3] = {
    coords = vector3(-528.22, -205.03, 38.18), 
    length = 4.0,
    width = 1,
    heading = 255
  },
  [4] = {
    coords = vector3(-522.46, -210.7, 37.65), 
    length = 0.6,
    width = 3,
    heading = 120
  },
  [5] = {
    coords = vector3(-523.07, -212.23, 37.7), 
    length = 0.6,
    width = 2.6,
    heading = 30
  },
  [6] = {
    coords = vector3(-525.27, -210.11, 37.7), 
    length = 4.2,
    width = 0.6,
    heading = 350
  },
  [7] = {
    coords = vector3(-530.36, -213.53, 37.68), 
    length = 3.2,
    width = 0.8,
    heading = 80
  },
  [8] = {
    coords = vector3(-530.2, -216.53, 37.6), 
    length = 0.6,
    width = 2.2,
    heading = 30
  },
  [9] = {
    coords = vector3(-531.9, -215.97, 37.65), 
    length = 2.4,
    width = 0.6,
    heading = 30
  },
}


function loc(num)
  exports['qb-target']:AddBoxZone("loc_"..num, locations[num].coords, locations[num].length, locations[num].width, {
    name = "loc_"..num,
    heading = locations[num].heading,
    minZ=locations[num].coords.z-1,
    maxZ=locations[num].coords.z+1,
  }, {
    options = {
        {
          event = "FN-gardening:workbushes",
          icon = 'fa fa-scissors',
          label = "Start Working",
          loc = num
        },
    },
    distance = 1.5
  })
end