# ── 大厅综合菜单（上下文 = 玩家）──
# 由 states/0/sec1 在每个玩家【每次回到大厅】时调用一次（靠 lobby_menu_shown 标记，
# 离开大厅时由 ticks/sec1 把标记摘掉，所以下一局回来会再弹一次）。
#
# 两个按钮都走 trigger：click_event 对非 OP 玩家只能跑 trigger。
#   guide_trigger  → 由 guide/tick1 每秒(每 tick)补权限并处理
#   lobby_trigger  → 由 statistics/tick1 补权限，statistics/read 显示战绩面板
# 这两个 trigger 都只在 #steps=0（大厅）时有效，战斗中点了无效。
tellraw @s [{"text":"\n"},{"text":"════ TKOT 大厅 ════","color":"gold","bold":true},{"text":"\n"},{"text":" 生涯：击杀 ","color":"gray"},{"score":{"name":"@s","objective":"total.kill"},"color":"aqua"},{"text":"  ·  死亡 ","color":"gray"},{"score":{"name":"@s","objective":"total.death"},"color":"red"},{"text":"\n"},{"text":"[ 图鉴 ]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"trigger guide_trigger set 1"},"hover_event":{"action":"show_text","value":"查看 道具 / 职业 / 地图 / 模式"}},{"text":"    "},{"text":"[ 战绩 ]","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger lobby_trigger set 1"},"hover_event":{"action":"show_text","value":"参与 / 胜利 / 死亡 / 击杀 / 胜率 / K/D"}},{"text":"\n"}]
