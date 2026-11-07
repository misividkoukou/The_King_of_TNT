# ── 放回大厅 ──
# 结构模板：tkot:lobby（data/tkot/structure/lobby.nbt）
# 落点 (0, -56, 200)：区域 x 0..47 / z 200..247。地图区只往 -z/+x 扩张，不会占用这里。
#
# 职责只有两件：放结构、管冷却/重试。
# 【不做传送】—— 传送由调用方负责：
#   开档       → load 里另外 schedule 一次 tp_all
#   每局开始   → 玩家本来就站在准备台上，不用动
#   结算       → states/3/tp 会调 tp_all
#   掉出大厅   → lobby/rescue 自己传送
# 以前这里也带一次条件传送，和上面几处重复，已去掉。

execute store success score #lobby_ok int run place template tkot:lobby 0 -56 200 none none 1 0

# 成功 → 重试计数归零 + 3 秒冷却（防抖）
execute if score #lobby_ok int matches 1 run scoreboard players set #lobby_try int 0

# 失败 → 计数 +1，并给 2 秒冷却。
# 冷却必须失败时也设：否则 rescue 会在下一 tick 立刻再调一次，变成每 tick 重放结构。
execute if score #lobby_ok int matches 0 run scoreboard players add #lobby_try int 1
execute if score #lobby_ok int matches 0 run scoreboard players set #lobby_cd int 40
execute if score #lobby_ok int matches 0 if score #lobby_try int matches ..5 run schedule function tkot:lobby/place_lobby 2t replace
# 5 次都失败 → 报警并归零（下次开局/重载再试）
execute if score #lobby_ok int matches 0 if score #lobby_try int matches 6.. run tellraw @a [{"text":"[TKOT] 大厅复位失败：模板 tkot:lobby 未加载（已重试 5 次）","color":"red"}]
execute if score #lobby_ok int matches 0 if score #lobby_try int matches 6.. run scoreboard players set #lobby_try int 0
