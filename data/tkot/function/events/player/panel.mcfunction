# ══════════════════════════════════════════════════════════
#  投票界面（纯 tellraw，无宏，随便改）
# ══════════════════════════════════════════════════════════
#
#  ★ 发送对象：@a[tag=vote_viewer]  = 场外玩家（大厅 + 旁观）
#    标签由 open.mcfunction 打上，这里不用管。
#
#  ★ 每个按钮就是一条 tellraw，改颜色/文字/排版直接改这几行。
#    唯一不能动的是 click_event 里的 `trigger vote set N`（N 必须是该事件的编号）。
#
#  ★ 如果以后在 table.mcfunction 里加/删事件，这里也要同步加/删一行。
#    "御剑飞行","月球漫步","脆皮五花","增生药剂"
# ── 头部 ──
tellraw @a[tag=vote_viewer] [{"text":"\n"},{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"},{"text":" 事件由我决定 ","color":"aqua","bold":true},{"text":"│ ","color":"dark_gray"},{"text":"点下面的按钮投票 ","color":"gray"},{"text":"│ ","color":"dark_gray"},{"text":"10 秒后截止","color":"yellow"}]

# ── 按钮：事件 1~10（开局就能投）── 4个一排
tellraw @a[tag=vote_viewer] [{"text":"[","color":"dark_gray"},{"text":"特殊道具","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 1"},"hover_event":{"action":"show_text","value":{"text":"额外获得可能获得道具的机会","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"物资补给","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 2"},"hover_event":{"action":"show_text","value":{"text":"普通道具100%获取","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"光芒四射","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 3"},"hover_event":{"action":"show_text","value":{"text":"亮起来！ 亮起来！","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"隐身涂层","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 4"},"hover_event":{"action":"show_text","value":{"text":"隐身喵~","color":"green"}}},{"text":"]\n","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"阴魂不散","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 5"},"hover_event":{"action":"show_text","value":{"text":"BOOM！大炸弹！","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"连锁换位","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 6"},"hover_event":{"action":"show_text","value":{"text":"换换换！位位位！","color":"green"}}},{"text":"]\n","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"御剑飞行","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 7"},"hover_event":{"action":"show_text","value":{"text":"妈妈我可以飞天了！但是代价是什么呢?","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"月球漫步","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 8"},"hover_event":{"action":"show_text","value":{"text":"月球漫步...注意事件o...","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"脆皮五花","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 9"},"hover_event":{"action":"show_text","value":{"text":"大学生这一块","color":"green"}}},{"text":"]  ","color":"dark_gray"},{"text":"[","color":"dark_gray"},{"text":"增生药剂","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 10"},"hover_event":{"action":"show_text","value":{"text":"绿巨人的血量!","color":"green"}}},{"text":"]","color":"dark_gray"}]

# ── 按钮：事件 11 边界收缩（战斗满 2 分钟后才出现）──
execute if score #game_min_timer int matches 2.. run tellraw @a[tag=vote_viewer] [{"text":"[","color":"dark_gray"},{"text":"边界收缩","color":"green","bold":true,"click_event":{"action":"run_command","command":"trigger vote set 11"},"hover_event":{"action":"show_text","value":{"text":"小点好啊...","color":"green"}}},{"text":"]","color":"dark_gray"}]

# ── 底部 ──
tellraw @a[tag=vote_viewer] [{"text":"─────────────────────","color":"gold","strikethrough":true},{"text":"\n"}]
