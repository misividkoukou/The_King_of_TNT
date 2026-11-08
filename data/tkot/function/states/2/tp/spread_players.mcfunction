# 每人随机一个格子（1..9）
execute as @a[team=!debug,gamemode=!spectator] run execute store result score @s spawn_point run random value 1..9

effect give @a[team=!debug,gamemode=!spectator] slow_falling 8 0 true

$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=1}] 12 $(height) -12
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=2}] 12 $(height) -24
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=3}] 12 $(height) -36
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=4}] 24 $(height) -12
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=5}] 24 $(height) -24
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=6}] 24 $(height) -36
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=7}] 36 $(height) -12
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=8}] 36 $(height) -24
$tp @a[team=!debug,gamemode=!spectator,scores={spawn_point=9}] 36 $(height) -36

# 把重生点改到各自脚下：
# 不然被淘汰后会立刻在「大厅里的重生点」复活，结算那 5 秒就看不到人了。
# 下一局回到大厅时，states/0/sec1 会把重生点重新设回大厅。
execute as @a[team=!debug,gamemode=!spectator] at @s run spawnpoint @s ~ ~ ~

scoreboard players reset @a[team=!debug,gamemode=!spectator] spawn_point
