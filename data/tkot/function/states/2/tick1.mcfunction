# 掉出地图直接处死（只对本局存活玩家生效）
function tkot:states/2/mechanics/height_trace

# 每 tick 重新计数（先清零再累加）
scoreboard players set #total_player int 0
scoreboard players set #alive_player int 0

# 淘汰：本局存活（statu=2）里 death>=1 的，改成观战身份 statu=3
# 先提示再改身份，否则同一 tick 里条件就不成立了
execute as @a[scores={statu=2,death=1..}] run title @s title {"text":"你已被淘汰","color":"red"}
execute as @a[scores={statu=2,death=1..}] run playsound entity.player.hurt master @s
execute as @a[scores={statu=2,death=1..}] run scoreboard players set @s statu 3

# 本局人数 = 存活(2) + 已淘汰(3)
execute as @a[scores={statu=2..3}] run scoreboard players add #total_player int 1
execute as @a[scores={statu=2}] run scoreboard players add #alive_player int 1

# 只剩 0~1 人存活 → 结算（0 人是全员掉线的保险）
execute if score #alive_player int matches ..1 run function tkot:states/2/next_statu
