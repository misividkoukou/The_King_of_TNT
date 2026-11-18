# ── 战斗开始时的世界边界设置 ──
# 由 states/2/spread 在开战时调用。
#
# 初始大小必须和 events/game/border/statu_judge 的第一档一致（现在是 50），
# 否则 judge 永远匹配不到第一档，整条缩圈链（50→40→30→20→10）不会启动。
#
# ★ 26.3 起 warning time 的单位也是【刻】，15s 才是 15 秒。
worldborder center 24 -24
worldborder set 50
worldborder warning distance 2
worldborder warning time 15s
# 缓冲 0 格：一越过边界就掉血（贴着边界不掉，跨出去就掉）
worldborder damage buffer 0
# 每格每秒 0.1 伤害（原来 0.5，缩圈逼人但不会瞬间致死）
worldborder damage amount 0.1
