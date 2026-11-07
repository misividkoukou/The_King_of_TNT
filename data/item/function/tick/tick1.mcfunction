# ── 每 tick 循环 ──
#exp_arrow
function item:exp_arrow/tick1

# 落地即炸的 TNT：贴地就把 fuse 改成 1
function item:instant_tnt/meet_ground

# 飞行羽毛计时：每秒 20 tick，40 约为 2 秒
# 必须在 tick 里递减而不是用 schedule：schedule 没有实体上下文，@s 恢复不了重力
scoreboard players remove @a[tag=flying] fly_time 1
execute as @a[tag=flying,scores={fly_time=..0}] run function item:fly_feather/reset

schedule function item:tick/tick1 1t replace
