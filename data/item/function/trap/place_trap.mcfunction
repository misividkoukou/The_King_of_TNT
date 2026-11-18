# ── 埋雷（由 advancement item:trap 触发，上下文 = 玩家）──

# ★ 必须先撤销进度：consume_item 类型的进度只会触发一次，
#   不撤销的话这个玩家之后再右键就再也不会埋雷了（其他道具的 throw_tnt 都有这一行）。
advancement revoke @s only item:trap

# 在脚下生成隐形 Marker，先打 arming 标签（20 tick 后由 trap/tick1 转成 active）
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["trap","arming"]}

# 倒计时 20 tick = 1 秒
scoreboard players set @e[type=marker,tag=arming,sort=nearest,limit=1] int 20

# 放置音效
execute at @s run playsound minecraft:block.stone.place master @s ~ ~ ~ 1 1
