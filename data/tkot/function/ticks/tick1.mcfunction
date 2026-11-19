# 全局玩家状态（任何阶段都跑）
function tkot:states/overall/tick1
function tkot:statistics/tick1
# 图鉴入口：只在大厅（#steps=0）放开，战斗中自动失效
function tkot:guide/tick1

# 事件临时属性（御剑飞行 / 月球漫步 / 脆皮五花 / 增生药剂）的 10 秒倒计时
# 必须放在全局 tick 里：万一回合在这个过程中结束，倒计时仍然会把属性还原干净
function tkot:events/game/attr/tick

#1 无tick1
execute if score #steps int matches 0 run function tkot:states/0/tick1
execute if score #steps int matches 2 run function tkot:states/2/tick1
execute if score #steps int matches 3 run function tkot:states/3/tick1

schedule function tkot:ticks/tick1 1t replace
