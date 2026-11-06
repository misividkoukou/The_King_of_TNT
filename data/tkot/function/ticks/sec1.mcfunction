execute if score #steps int matches 0 run function tkot:states/0/sec1
execute if score #steps int matches 1 run function tkot:states/1/sec1
execute if score #steps int matches 2 run function tkot:states/2/sec1
execute if score #steps int matches 3 run function tkot:states/3/sec1

schedule function tkot:ticks/sec1 1s replace