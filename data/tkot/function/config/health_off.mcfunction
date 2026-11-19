# ── 关闭 Tab（list 槽位）的生命值显示 ──
# 管理员执行：/function tkot:config/health_off
# setdisplay 后面不写 objective = 清空该槽位，立即生效，不需要 /reload。
scoreboard objectives setdisplay list
scoreboard players set #show_health int 0
