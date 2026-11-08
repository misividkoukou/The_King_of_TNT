# ── 抽取并触发一个随机事件 ──
# 前 5 分钟有 3 种事件（无缩圈），之后加入缩圈（第 4 种）
execute if score #steps int matches 2 if score #game_min_timer int matches ..5 run execute store result score #events int run random value 1..3
execute if score #steps int matches 2 if score #game_min_timer int matches 5.. run execute store result score #events int run random value 1..4

# 事件播报（让玩家知道刚刚发生了什么）
execute if score #events int matches 1 run tellraw @a [{"text":"[TKOT·事件] ","color":"gold"},{"text":"特殊道具","color":"aqua"}]
execute if score #events int matches 2 run tellraw @a [{"text":"[TKOT·事件] ","color":"gold"},{"text":"物资补给","color":"aqua"}]
execute if score #events int matches 3 run tellraw @a [{"text":"[TKOT·事件] ","color":"gold"},{"text":"光芒四射","color":"aqua",hover_event:{action:"show_text",value:[{text:"玩家将会发光!"}]}}]
execute if score #events int matches 4 run tellraw @a [{"text":"[TKOT·事件] ","color":"gold"},{"text":"边界收缩","color":"red"}]

execute if score #events int matches 1 run function tkot:events/game/offer_special_item/random
execute if score #events int matches 2 run function tkot:events/game/offer_normal_item/player
execute if score #events int matches 3 run function tkot:events/game/glowing/effect

#这一个永远都是排在最后的
execute if score #events int matches 4 run function tkot:events/game/border/statu_judge
