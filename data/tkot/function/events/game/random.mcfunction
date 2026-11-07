execute if score #steps int matches 2 if score #game_min_timer int matches ..5 run execute store result score #events int run random value 1..3
execute if score #steps int matches 2 if score #game_min_timer int matches 5.. run execute store result score #events int run random value 1..4

execute if score #events int matches 1 run function tkot:events/game/offer_special_item/random
execute if score #events int matches 2 run function tkot:events/game/offer_normal_item/player
execute if score #events int matches 3 run function tkot:events/game/glowing/effect

#这一个永远都是排在最后的
execute if score #events int matches 4 run function tkot:events/game/border/statu_judge