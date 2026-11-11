# ── 事件投票：开始投票（距下次事件 20 秒）──
#
# 机制：trigger 计分板（vote）+ 点击聊天按钮
#   · 按钮执行 trigger vote set N（N = 事件编号）
#   · trigger 用完会自动取消权限 → 每人每轮只能投一次，不能改票
#
# ★ 界面：panel.mcfunction 里是纯 tellraw，没有宏，改样式直接改那边。
# ★ 只有"清空上一轮票数"和"统计票数"还用宏循环（step/reset、step/close），
#   那部分是计分逻辑，不涉及界面。

# 用宏循环清空上一轮票数
data modify storage tkot:vote step set value "tkot:events/player/step/reset"
function tkot:events/player/run

scoreboard players set #vote_total int 0
scoreboard players set #vote_ready int 0
scoreboard players set #next_event int 0

# 投票权：旁观者 + 大厅里的人可以投，场上还活着的参战者不能（不能决定自己的命运）
# 注意：scoreboard 没有 disable 子命令！
#       官方的"关闭 trigger 权限"方式就是 scoreboard players reset（reset 会同时取消 trigger）。
scoreboard players reset @a vote
scoreboard players enable @a[team=!debug] vote
scoreboard players reset @a[team=!debug,scores={statu=2}] vote

# ── 界面收件人：只给明确的场外身份（大厅 0..1 / 旁观 3..4）──
tag @a[team=!debug,scores={statu=0..1}] add vote_viewer
tag @a[team=!debug,scores={statu=3..4}] add vote_viewer

# 弹界面（纯 tellraw，内部自带头部/按钮/底部）
function tkot:events/player/panel

# 收尾：去掉临时标签
tag @a remove vote_viewer
