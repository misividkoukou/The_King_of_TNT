# ── 投票结果播报（美化区）──
# ★ 发给所有人（含场上玩家），见 issue #61
#
# 第 1 行：有投票 → "投票结果" 抬头
# 第 2 行：事件名（由 say_result 的宏生成，见下）
# 第 3 行：没人投票 → 随机事件预告

execute if score #vote_ready int matches 1 run tellraw @a [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 本轮事件 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"共 ","color":"gray"},{"score":{"name":"#vote_total","objective":"int"},"color":"yellow"},{"text":" 票投出","color":"gray"}]
execute if score #vote_ready int matches 1 run function tkot:events/player/show_result

execute if score #vote_ready int matches 0 run tellraw @a [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 本轮事件 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"没人投票，5 秒后随机触发","color":"yellow"}]


execute if score #left int matches 5 as @a[team=debug] run tellraw @s [{"text":"[TKOT·调试] 投票结果播报：vote_ready=","color":"gold"},{"score":{"name":"#vote_ready","objective":"int"},"color":"gold"},{"text":"  total=","color":"gold"},{"score":{"name":"#vote_total","objective":"int"},"color":"gold"},{"text":"  next_event=","color":"gold"},{"score":{"name":"#next_event","objective":"int"},"color":"gold"}]
