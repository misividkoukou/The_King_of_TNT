# ── 开局失败兜底 ──
# 触发条件：该进入下一状态时，发现没有任何“本局玩家”（statu=2）或“准备中玩家”（statu=1）。
# 以前遇到这种情况会一路跑下去，表现为「存活 0/0、谁都不淘汰、游戏永不结束」，且没有任何报错。
worldborder center 0.0 0.0
worldborder set 59999968

tellraw @a [{"text":"[TKOT] ","color":"red"},{"text":"开局失败：没有检测到本局玩家，已中断并回到大厅。","color":"yellow"}]

# 关掉所有本局相关的调度
schedule clear tkot:states/2/give_item
# maps/pick 已经 forceload 过地图区块，abort 不走结算流程，必须在这里回收
# （否则强加载区块会一直占着内存，而且已排队的开场铺图还会把地图放出来）
schedule clear tkot:states/1/place_map
# 结算延迟也要取消，否则它会在这条中止路径上再跑一次
schedule clear tkot:states/3/delay
scoreboard players set #over_wait int 0
execute if score #map_num int matches 1.. run forceload remove 0 -48 47 -1

# 清状态
effect clear @a
scoreboard players set #steps int 0
scoreboard players set #prepare sec -1
scoreboard players set #temp sec 0
scoreboard players set #total_prepare int 0
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0

scoreboard players reset #game_min_timer int
scoreboard players reset #game_sec_timer int
scoreboard players reset #game_event_timer int

# 身份回大厅
scoreboard players set @a statu 0
tag @a remove in_arena
gamemode adventure @a
# 开局失败也要把 PVP 关回大厅状态：这条路径不经过 states/3，否则会漏
gamerule pvp false
