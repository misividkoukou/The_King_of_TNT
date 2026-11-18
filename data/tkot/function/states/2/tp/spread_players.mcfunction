# ── 分配出生点 ──
# 编号 1..9 对应每张地图自己的 9 个出生点（states/2/tp/spawns/mapN.mcfunction）
#
# 单人混战（#gamemode 1）：每人随机一个点位
# 组队模式（#gamemode 2/3）：队友共用同一个点位（红1 黄2 蓝3 绿4），没队的人随机兜底

execute if score #gamemode int matches 1 as @a[team=!debug,gamemode=!spectator] run execute store result score @s spawn_point run random value 1..9

execute if score #gamemode int matches 2.. as @a[team=red] run scoreboard players set @s spawn_point 1
execute if score #gamemode int matches 2.. as @a[team=yellow] run scoreboard players set @s spawn_point 2
execute if score #gamemode int matches 2.. as @a[team=blue] run scoreboard players set @s spawn_point 3
execute if score #gamemode int matches 2.. as @a[team=green] run scoreboard players set @s spawn_point 4

# 兜底：组队模式下没有队伍的人（没站台/被清出去）随机给一个点位，避免漏传
execute if score #gamemode int matches 2.. as @a[team=!debug,gamemode=!spectator] unless score @s spawn_point matches 1..9 run execute store result score @s spawn_point run random value 1..9

# 按地图号分发（#map_num 由 maps/pick 抽取时写入）
execute if score #map_num int matches 1 run function tkot:states/2/tp/spawns/map1
execute if score #map_num int matches 2 run function tkot:states/2/tp/spawns/map2
execute if score #map_num int matches 3 run function tkot:states/2/tp/spawns/map3
execute if score #map_num int matches 4 run function tkot:states/2/tp/spawns/map4
execute if score #map_num int matches 5 run function tkot:states/2/tp/spawns/map5
execute if score #map_num int matches 6 run function tkot:states/2/tp/spawns/map6
execute if score #map_num int matches 7 run function tkot:states/2/tp/spawns/map7

# 把重生点改到各自脚下：
# 不然被淘汰后会立刻在「大厅里的重生点」复活，结算那 5 秒就看不到人了。
# 下一局回到大厅时，states/0/sec1 会把重生点重新设回大厅。
execute as @a[team=!debug,gamemode=!spectator] at @s run spawnpoint @s ~ ~ ~

scoreboard players reset @a[team=!debug,gamemode=!spectator] spawn_point
