# ── 计票（宏，每个事件一行）──
# 场上活着的人（statu=2）那一票不算。
#
# ★ 这里【不再】用 $(votemax) 做上限判断：
#   那样一旦 close 没把 votemax 写进 storage，整条宏命令会被静默丢弃 → 一张票都统计不到。
#   上限校验改到 tally 末尾，用普通（非宏）命令做，可靠性高得多。
$execute as @a[team=!debug,scores={vote=$(i)}] unless score @s statu matches 2 run scoreboard players add #event_$(i)_vote int 1

function tkot:events/player/advance
