# ── 落点：暂时固定（分散函数以后再写）──
# 所有参战玩家统一落在场地中心 (x, y_spawn, z)。
# 以后写分散函数时，把下面第一行换掉即可，其余不用动。
# 原来的写法（留作参考）：
# $tp @a[team=!debug,gamemode=!spectator] $(x) $(y_spawn) $(z)
function tkot:states/2/tp/spread_players with storage tkot:map
# 调试队送到观察点
$tp @a[team=debug] $(x) $(y_debug) $(z)

title @a[team=!debug,gamemode=!spectator] title {"text":"开始战斗! 物资将在五秒后开始发放","color":"red"}

# 5 秒后开始发物资
execute if score #steps int matches 2 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] golden_carrot 5
schedule function tkot:states/2/give_item 5s replace