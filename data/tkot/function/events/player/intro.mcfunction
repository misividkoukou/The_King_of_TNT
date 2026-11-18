# ── 事件介绍（紧跟"事件名称"播报的下一行）──
# 按 #events（本轮事件号）分支，一条一行；改文案直接改这里。
# ★ 新增事件时：table.mcfunction 加一项后，这里也要按新编号加一行。

execute if score #events int matches 1 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"每人额外获得一次特殊道具抽奖机会","color":"gray"}]
execute if score #events int matches 2 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"每人立刻收到一批普通物资","color":"gray"}]
execute if score #events int matches 3 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"所有人被高亮，无处可藏","color":"gray"}]
execute if score #events int matches 4 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"全场进入隐身状态","color":"gray"}]
execute if score #events int matches 5 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"5 颗高爆 TNT 随机降落在场地里","color":"gray"}]
execute if score #events int matches 6 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"所有人的位置被随机打乱","color":"gray"}]
execute if score #events int matches 7 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"失重！像御剑一样飘起来","color":"gray"}]
execute if score #events int matches 8 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"重力变低，一步能跨很远","color":"gray"}]
execute if score #events int matches 9 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"所有人变成脆皮，血量上限大幅降低","color":"gray"}]
execute if score #events int matches 10 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"增生药剂：血量上限提高","color":"gray"}]
execute if score #events int matches 11 run tellraw @a [{"text":"  ▸ ","color":"dark_gray"},{"text":"世界边界向内收缩一次","color":"gray"}]
