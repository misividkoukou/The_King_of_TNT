# ── 结算入口 ────────────────────────────────────────────────
# 玩家立刻回大厅，地图复位在后台继续跑，结算画面在复位期间播放。
# 复位跑完之前 #steps 一直停在 3，所以没人能在半张地图上开新局。

# 1. 结算画面（subtitle 必须在 title 之前发）
title @a times 10 50 10
title @a subtitle [{"text":"胜利者 ","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"}]
title @a title {"text":"本局结束","color":"red"}
tellraw @a [{"text":"胜利者：","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"},{"text":" —— 已回到大厅，地图正在复位","color":"gray"}]
playsound entity.player.levelup master @a
# 2. 大厅复位：先把大厅放回去，再把人送进去（否则可能落在虚空里）
function tkot:states/3/place_lobby

# 3. 送回大厅
function tkot:states/3/tp

# 3. 清空携带物，切成大厅模式（道具不能带进大厅）
clear @a
gamemode adventure @a

# 4. 锁在状态 3，等 states/3/finish 把 #steps 归 0
scoreboard players set #steps int 3
# 新一轮复位，重试次数从 0 开始计
scoreboard players set #reset_retry int 0
function tkot:states/3/return_map

# 大厅增益由 effects/lobby 负责，这里不再给吸收