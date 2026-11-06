# ── 放回大厅 ──
# 结构模板：tkot:lobby（data/tkot/structure/lobby.nbt）
# 落点 (0, -56, 200)：区域 x 0..47 / z 200..247。
# 地图区只会往 -z 和 +x 扩张，所以这个位置永远不会被地图占用。
#
# 失败会自动重试（最多 5 次，每次隔 2 tick）——刚 forceload 完的区块需要一点时间加载。

execute store success score #lobby_ok int run place template tkot:lobby 0 -56 200 none none 1 0

# 成功 → 重试计数归零，并且立刻把所有人送进大厅。
# 传送必须在这里做：load 里的 remove int 会清空 #lobby_ok，而大厅要延后两 tick 才放得回去，
# 所以“放好之后再传送”只能由这个函数触发。
execute if score #lobby_ok int matches 1 run scoreboard players set #lobby_try int 0
execute if score #lobby_ok int matches 1 run tellraw @a [{"text":"[TKOT] 大厅已复位","color":"green"}]
execute if score #lobby_ok int matches 1 run function tkot:lobby/tp_all

# 失败 → 计数 +1，5 次以内继续重试
execute if score #lobby_ok int matches 0 run scoreboard players add #lobby_try int 1
execute if score #lobby_ok int matches 0 if score #lobby_try int matches ..5 run schedule function tkot:states/3/place_lobby 2t replace
# 5 次都失败 → 报警并归零（下次开局/重载再试）
execute if score #lobby_ok int matches 0 if score #lobby_try int matches 6.. run tellraw @a [{"text":"[TKOT] 大厅复位失败：模板 tkot:lobby 未加载（已重试 5 次）","color":"red"}]
execute if score #lobby_ok int matches 0 if score #lobby_try int matches 6.. run scoreboard players set #lobby_try int 0
