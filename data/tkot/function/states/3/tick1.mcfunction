# ── 状态 3 的看门狗（每 tick）──
# 正常复位 1~2 秒结束。超过 20 秒说明清理卡住了：
#   前 3 次 → 自动重来一次完整复位（自愈）
#   第 4 次仍然不行 → 放弃，强制收尾并报警

scoreboard players add #reset_timer int 1

# 20 秒超时：还有重试机会就重来
execute if score #reset_timer int matches 400.. if score #reset_retry int matches ..2 run function tkot:states/3/retry
# 重试 3 次都超时：放弃
execute if score #reset_timer int matches 400.. if score #reset_retry int matches 3.. run function tkot:states/3/giveup
