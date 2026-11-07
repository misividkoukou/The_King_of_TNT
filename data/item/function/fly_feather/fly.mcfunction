# 收回进度：不撤销的话 consume_item 只会触发一次
advancement revoke @s only item:fly

# 反重力：负数 = 向上飘
attribute @s minecraft:gravity base set -0.02

playsound minecraft:entity.player.teleport master @s ~ ~ ~ 1 1

# ── 计时：靠 item:tick/tick1 每 tick 递减，到 0 时恢复 ──
# 不能用 schedule 来恢复：schedule 调起的函数没有实体上下文，@s 会失效，
# 而"恢复重力"必须作用在具体玩家身上。所以用 tag + 分数计时。
# ★ 不要写成 schedule function tkot:states/reset ——
#   那是整局复位（statu 归 0、清背包、杀 TNT），用了羽毛会把这一局直接废掉。
tag @s add flying
scoreboard players set @s fly_time 40
