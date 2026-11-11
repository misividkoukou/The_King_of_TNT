# ═══════════════════════════════════════════════════════════
#  事件总表 + 投票系统（宏驱动）
# ═══════════════════════════════════════════════════════════
#
# ★★★ 以后增加事件，只需要改这一个文件 + 写一个事件本体函数 ★★★
#
#   ① names  / colors / funcs  三个列表末尾各追加一项（顺序必须一一对应）
#   ② count 改成新的事件总数
#   ③ 想让它"开局就能出现" → 追加在 early 范围内
#      想让它"解锁时间后才出现" → 追加在最后，并把 early / late 一起改
#   ④ 写 events/game/<名字>/xxx.mcfunction 作为事件本体
#   ⑤ 如果新事件是"会耗尽"的（像边界收缩），需要额外的失效标记，参考 border
#
# 每个事件的编号 = 它在列表里的位置 + 1（第 1 项 = 事件 1）
#
# ★ 排序规则：early 事件放前面，late 事件放最后。
#   目前只有「边界收缩」是 late，所以它固定在第 7 项（最后一项）。

data modify storage tkot:vote names set value ["特殊道具","物资补给","光芒四射","隐身涂层","阴魂不散","连锁换位","边界收缩"]

data modify storage tkot:vote colors set value ["aqua","green","yellow","light_purple","dark_red","aqua","red"]

# 事件本体：随机/投票最终会调用这里的函数
data modify storage tkot:vote funcs set value ["tkot:events/game/offer_special_item/random","tkot:events/game/offer_normal_item/player","tkot:events/game/glowing/effect","tkot:events/game/invisible/effect","tkot:events/game/summon_tnt/random","tkot:events/game/change_position/summon_armor","tkot:events/game/border/statu_judge"]

# 事件总数
data modify storage tkot:vote count set value 7

# early = 开局就能投/抽的事件数（1..early）；late = 需要解锁的事件起始编号（late..count）
# 现在：1~6 全是 early，只有第 7 项（边界收缩）是 late
data modify storage tkot:vote early set value 6
data modify storage tkot:vote late set value 7

# 解锁时间（分钟）：战斗开始多少分钟后，late 事件才进入随机池和投票界面
data modify storage tkot:vote unlock set value 2

# ★ 会"耗尽"的事件编号（边界收缩）。
#   边界缩到最小后 #border_dead = 1，roll/random 会按这个编号把它从抽取中排除。
#   这个编号必须和上面 funcs 里 statu_judge 的位置一致。
data modify storage tkot:vote border set value 7
