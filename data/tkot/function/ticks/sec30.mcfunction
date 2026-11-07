# 每 30 秒触发一次"特殊道具发放"事件（只在战斗阶段生效）
# 注意：这里必须调 events/game/offer_special_item/sec30，而不是自己。
# 以前误写成 function tkot:ticks/sec30（自己调自己），会无限递归。
execute if score #steps int matches 2 run function tkot:events/game/offer_special_item/sec30

schedule function tkot:ticks/sec30 30s replace
