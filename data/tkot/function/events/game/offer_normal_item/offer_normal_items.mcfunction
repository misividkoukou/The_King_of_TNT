# 自己触发，不然都是一样的
# 由 events/game/offer_normal_item/player 逐个玩家调用（上下文是玩家，所以用 @s）
# 战利品表：tkot:normal_item（普通弹 / 爆炸箭 / 胡萝卜 三选一）
loot give @s loot tkot:normal_item
