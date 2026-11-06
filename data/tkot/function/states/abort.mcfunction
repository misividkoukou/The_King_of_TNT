# ── 开局失败兜底 ──
# 触发条件：该进入下一状态时，发现没有任何“本局玩家”（statu=2）或“准备中玩家”（statu=1）。
# 以前遇到这种情况会一路跑下去，表现为「存活 0/0、谁都不淘汰、游戏永不结束」，且没有任何报错。

tellraw @a [{"text":"[TKOT] ","color":"red"},{"text":"开局失败：没有检测到本局玩家，已中断并回到大厅。","color":"yellow"}]

# 关掉所有本局相关的调度
schedule clear tkot:states/1/tp
schedule clear tkot:states/2/give_item

# 清状态
effect clear @a
scoreboard players set #steps int 0
scoreboard players set #prepare sec -1
scoreboard players set #temp sec 0
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0

# 身份回大厅
scoreboard players set @a statu 0
tag @a remove in_arena
gamemode adventure @a
