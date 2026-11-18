# ── 投票结果播报（美化区）──
# ★ 发给所有人（含场上玩家），见 issue #61
#
# 三种情况必须分开播报，否则玩家会被误导：
#   #vote_ready = 1            → 有结果，显示事件名
#   #vote_ready = 0 且 #vote_opened = 1 → 开了投票但没人投
#   #vote_ready = 0 且 #vote_opened = 0 → 本轮根本不开放投票

execute if score #vote_ready int matches 1 run tellraw @a [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 本轮事件 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"共 ","color":"gray"},{"score":{"name":"#vote_total","objective":"int"},"color":"yellow"},{"text":" 票投出","color":"gray"}]
execute if score #vote_ready int matches 1 run function tkot:events/player/show_result

execute if score #vote_ready int matches 0 if score #vote_opened int matches 1 run tellraw @a [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 本轮事件 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"开了投票但没人投，5 秒后随机触发","color":"yellow"}]

execute if score #vote_ready int matches 0 if score #vote_opened int matches 0 run tellraw @a [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 本轮事件 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"本轮不开放投票，5 秒后随机触发","color":"yellow"}]

execute if score #left int matches 5 as @a[team=debug] run tellraw @s [{"text":"[TKOT·调试] 投票结果播报：vote_ready=","color":"gold"},{"score":{"name":"#vote_ready","objective":"int"},"color":"gold"},{"text":"  opened=","color":"gold"},{"score":{"name":"#vote_opened","objective":"int"},"color":"gold"},{"text":"  total=","color":"gold"},{"score":{"name":"#vote_total","objective":"int"},"color":"gold"},{"text":"  next_event=","color":"gold"},{"score":{"name":"#next_event","objective":"int"},"color":"gold"}]
