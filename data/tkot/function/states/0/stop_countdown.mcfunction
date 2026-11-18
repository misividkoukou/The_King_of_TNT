# 玩家不足，取消开局
# ★ 节流：5 秒内只播报一次
#   玩家反复上下准备台会让"起算 → 取消 → 再起算"循环，不节流会刷屏。
scoreboard players set #prepare sec -1

execute if score #cancel_cd int matches 1.. run return 0
scoreboard players set #cancel_cd int 5

tellraw @a [{"text":"玩家不足,游戏已取消","color":"red"}]
playsound entity.villager.no player @a
title @a times 0 20 0
title @a title {"text":"玩家不足,游戏已取消","color":"red"}
