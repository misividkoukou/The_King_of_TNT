# 自己触发，不然都是一样的
# 由 events/game/offer_special_item/player 调用（上下文是玩家，所以用 @s）
# 战利品表：tkot:special_item（瞬爆弹 / 多重射击弹 / 治疗池）
#
# 用 store success 捕获失败，失败时聊天栏直接报出来，便于定位。
execute store success score #loot_ok int run loot give @s loot tkot:special_item
execute if score #loot_ok int matches 0 run tellraw @s [{"text":"[TKOT] 特殊道具发放失败：战利品表 tkot:special_item 未加载或解析错误","color":"red"}]
