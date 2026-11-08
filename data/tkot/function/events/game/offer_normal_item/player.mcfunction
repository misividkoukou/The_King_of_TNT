# 逐个参战者发放普通物资
#
# 两个门槛，缺一不可：
#   ① #steps == 2      —— 只在战斗阶段发。statu=2 从开局准备(0→1)就被设上了，
#                          光看 statu 的话开场冻结那 5 秒（人还在大厅）就会开始发。
#   ② #fight_time >= 100 —— 战斗真正开始 5 秒后才发，
#                          正好对上 states/2/give_item 发放弩的时刻（"物资将在五秒后发放"）。
#                          #fight_time 由 states/2/tick1 每 tick +1，只在状态 2 累加，
#                          比额外维护一个开局开关更可靠（开关漏设会静默失败、连报错都没有）。
execute if score #steps int matches 2 if score #fight_time int matches 100.. as @a[team=!debug,gamemode=!spectator,scores={statu=2}] run function tkot:events/game/offer_normal_item/offer_normal_items
