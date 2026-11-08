# 自己触发，不然都是一样的
# 由 events/game/offer_normal_item/player 逐个玩家调用（上下文是玩家，所以用 @s）
# 战利品表：tkot:normal_item（普通弹 / 爆炸箭 / 胡萝卜）
#
# 用 store success 捕获失败：如果表没加载/解析失败，聊天栏会直接告诉你，
# 不用再靠猜。
execute store success score #loot_ok int run loot give @s loot tkot:normal_item
execute if score #loot_ok int matches 0 run tellraw @s [{"text":"[TKOT] 普通道具发放失败：战利品表 tkot:normal_item 未加载或解析错误","color":"red"}]
