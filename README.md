# FN-gardening
Simple gardening script.

# add this in qb-core/shared/items.lua
    ['scissors'] = {['name'] = 'scissors', ['label'] = 'Tesoura', ['weight'] = 0, ['type'] = 'item', ['image'] = 'scissors.png', ['unique'] = false, ['useable'] = false, ['shouldClose'] = false, ['combinable'] = nil, ['description'] = 'Esta merda para a jardinagem deve dar jeito'},

  
 # add this in dpemotes/client/animationlist.lua
    ["gardening"] = {"anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", "gardner", AnimationOptions =
    {
       Prop = "v_ret_gc_scissors",
       PropBone = 18905,
       PropPlacement = {0.13, 0.15, 0.0, -10.0, 0.0, -20.0},
       EmoteLoop = true,
    }},

