# ── 打开 Tab（list 槽位）的生命值显示 ──
# 管理员执行：/function tkot:config/health_on
# 立即生效，不需要 /reload。
# ★ 槽位约定：list 只给生命值用，击杀/KD 只进私聊战绩面板（见 statistics/show）。
scoreboard objectives setdisplay list hp
scoreboard players set #show_health int 1
