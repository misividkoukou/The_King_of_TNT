# 只对“本局还活着”（statu=2）生效：已淘汰转观战的玩家会在场地外飞，不能被反复处死。
# 死亡区 y -20 ~ -2（地板在 -1）。
# 不能照原来的 -64..-10：大厅在 y=-55，那样大厅会整块落在死亡区里，任何人被 tp 回去就直接死。
execute as @a[scores={statu=2},team=!debug] at @s if entity @s[y=-20,dy=18] run function tkot:states/2/mechanics/damage
