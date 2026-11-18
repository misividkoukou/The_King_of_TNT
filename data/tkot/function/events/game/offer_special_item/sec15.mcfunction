# 每 15 秒抽一次特殊道具（由 ticks/sec15 调用，已经在外面判过 #steps=2）
execute if score #steps int matches 2 run function tkot:events/game/offer_special_item/random
