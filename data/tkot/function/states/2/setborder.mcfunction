# ── 战斗开始时的世界边界设置 ──
# 由 states/2/spread 在开战时调用。
#
# 关键：这里必须把边界初始大小设成 26，
# events/game/border/statu_judge 是靠 worldborder get 的返回值做分支的，
# 不设 26 的话它永远匹配不到第一档，整条缩圈链（26→20→15→10→5）不会启动。
worldborder center 24 -24
worldborder set 50
worldborder warning time 15
worldborder damage buffer 0
worldborder damage amount 0.5
