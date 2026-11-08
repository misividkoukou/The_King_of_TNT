# ── 状态 3（每 tick）──
#
# 1) 结算停留倒计时：100 tick → 归零时执行 delay（回大厅 + 开始复位）
# 2) 复位看门狗：只在停留结束后才计时

# 停留倒计时
execute if score #over_wait int matches 1.. run scoreboard players remove #over_wait int 1
execute if score #over_wait int matches 0 run function tkot:states/3/delay

# 复位看门狗（#over_wait = -1 表示停留已结束、复位已开始）
# 正常 1~2 秒结束；超过 20 秒说明卡住了：前 3 次重来，第 4 次放弃
execute if score #over_wait int matches ..-1 run scoreboard players add #reset_timer int 1
execute if score #over_wait int matches ..-1 if score #reset_timer int matches 400.. if score #reset_retry int matches ..2 run function tkot:states/3/retry
execute if score #over_wait int matches ..-1 if score #reset_timer int matches 400.. if score #reset_retry int matches 3.. run function tkot:states/3/giveup
