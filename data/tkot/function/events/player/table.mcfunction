# ═══════════════════════════════════════════════════════════
#  事件总表 + 投票系统（宏驱动）
# ═══════════════════════════════════════════════════════════
#
# ★★★ 以后增加事件，改这个文件 + 写事件本体 + 改 intro/panel ★★★
#
#   ① names / colors / funcs 三个列表末尾各追加一项（顺序必须一一对应）
#   ② count 改成新的事件总数
#   ③ early = 开局可投的事件数；late = 需要解锁的起始编号
#   ④ 写 events/game/<名字>/player.mcfunction 作为事件本体
#   ⑤ events/player/intro.mcfunction 加一行介绍
#   ⑥ events/player/panel.mcfunction 加一个投票按钮
#   ⑦ 会"耗尽"的事件（如边界收缩）需要额外的失效标记，参考 border
#
# 每个事件的编号 = 它在列表里的位置 + 1（第 1 项 = 事件 1）
#
# 目前：1~10 全是 early，第 11 项「边界收缩」是唯一的 late。

data modify storage tkot:vote names set value ["特殊道具","物资补给","光芒四射","隐身涂层","阴魂不散","连锁换位","御剑飞行","月球漫步","脆皮五花","增生药剂","边界收缩"]

data modify storage tkot:vote colors set value ["aqua","aqua","aqua","aqua","aqua","aqua","aqua","aqua","aqua","aqua","aqua"]

# 事件本体：随机/投票最终会调用这里的函数
data modify storage tkot:vote funcs set value ["tkot:events/game/offer_special_item/random","tkot:events/game/offer_normal_item/player","tkot:events/game/glowing/effect","tkot:events/game/invisible/effect","tkot:events/game/summon_tnt/random","tkot:events/game/change_position/summon_armor","tkot:events/game/no_gravity/player","tkot:events/game/low_gravity/player","tkot:events/game/poor_health/player","tkot:events/game/good_health/player","tkot:events/game/border/statu_judge"]

# 事件总数
data modify storage tkot:vote count set value 11

# early = 开局就能投/抽的事件数（1..early）；late = 需要解锁的事件起始编号（late..count）
# 现在：1~10 全是 early，只有第 11 项（边界收缩）是 late
data modify storage tkot:vote early set value 10
data modify storage tkot:vote late set value 11

# 解锁时间（分钟）：战斗开始多少分钟后，late 事件才进入随机池和投票界面
data modify storage tkot:vote unlock set value 2

# ★ 会"耗尽"的事件编号（边界收缩）。
#   边界缩到最小后 #border_dead = 1，roll/random 会按这个编号把它从抽取中排除。
#   这个编号必须和上面 funcs 里 statu_judge 的位置一致（现在是第 11 项）。
data modify storage tkot:vote border set value 11
