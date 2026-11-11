# ── 每轮 50% 概率开放投票 ──
# 随机 1..2：1 = 开放投票，2 = 本轮不投票、直接随机
execute store result score #vote_roll int run random value 1..2

execute if score #vote_roll int matches 1 run scoreboard players set #vote_opened int 1
execute if score #vote_roll int matches 1 run function tkot:events/player/open

execute if score #vote_roll int matches 2 run scoreboard players set #vote_opened int 0

# ★ 不开投票时的通知只发给【明确的场外身份】：
#     statu 0..1 = 大厅里等下一局的
#     statu 3..4 = 本局已淘汰 / 局外观战
#   用正面白名单而不是 unless statu=2，避免 statu 未初始化（nil）的人被误判成"场外"。
#   场上正在游戏的 statu=2 一个都收不到。
execute if score #vote_roll int matches 2 as @a[team=!debug,scores={statu=0..1}] run tellraw @s [{"text":"[TKOT·事件] ","color":"gold"},{"text":"本轮不开放投票，由系统随机决定","color":"gray"}]
execute if score #vote_roll int matches 2 as @a[team=!debug,scores={statu=3..4}] run tellraw @s [{"text":"[TKOT·事件] ","color":"gold"},{"text":"本轮不开放投票，由系统随机决定","color":"gray"}]
