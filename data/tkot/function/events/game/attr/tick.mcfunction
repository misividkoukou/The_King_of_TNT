# ── 临时事件属性：每 tick 倒计时（由 ticks/tick1 调用）──
# 只处理被 arm 打过标记的玩家，其它人零开销。
scoreboard players remove @a[tag=attr_temp] attr_timer 1
execute as @a[tag=attr_temp,scores={attr_timer=..0}] run function tkot:events/game/attr/reset
