scoreboard players set @a statu 0
execute as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-1 ~ green_concrete run function tkot:states/0/player_cacu
execute as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-2 ~ green_concrete run function tkot:states/0/player_cacu
