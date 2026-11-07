execute store result score #border_range int run worldborder get
execute if score #border_range int matches 50 run function tkot:events/game/border/to40
execute if score #border_range int matches 40 run function tkot:events/game/border/to30
execute if score #border_range int matches 30 run function tkot:events/game/border/to20
execute if score #border_range int matches 20 run function tkot:events/game/border/to10
execute if score #border_range int matches 10 run function tkot:events/game/border/end



