# 逐个参战者发放特殊道具
#
# 门槛和普通物资一致：战斗阶段 + 开局 5 秒之后（弩发下来之后）。
execute if score #steps int matches 2 if score #fight_time int matches 100.. as @a[team=!debug,gamemode=!spectator,scores={statu=2}] run function tkot:events/game/offer_special_item/offer_special_items
