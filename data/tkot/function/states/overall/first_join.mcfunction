# 第一次进服的玩家
# joined 是永久标记，只打一次；身份全部靠 statu 分数（0=大厅）
tag @s add joined
scoreboard players set @s statu 0
scoreboard players set @s round 0
scoreboard players set @s player_round 0
scoreboard players set @s player_win 0
scoreboard players set @s total.death 0
# 保证 death 这项一定存在，否则 scores={death=1..} 对新人永远不成立
scoreboard players add @s death 0

gamemode adventure @s

# 大厅传送点统一在 lobby/tp_point 里维护；单人用 tp_self（它内部就是调 tp_point）
function tkot:lobby/tp_self
tellraw @s [{"text":"欢迎来到 TKOT！","color":"gold"},{"text":" 站到 "},{"text":"绿色混凝土","color":"green"},{"text":" 上即可准备，2 人以上自动开局。","color":"white"}]
playsound entity.villager.yes master @s
