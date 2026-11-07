# 只对“本局还活着”（statu=2）生效：已淘汰转观战的玩家会在场地外飞，不能被反复处死。
# 死亡区：场地平面范围内（x 0..47 / z -48..-1），y -20 ~ -2（地板在 -1）。
# 加 x/z 范围是为了双保险：光靠 y 判定，万一以后有别的区域落在这个高度会误杀。
execute as @a[scores={statu=2},team=!debug] at @s if entity @s[x=0,y=-20,z=-48,dx=48,dy=18,dz=48] run function tkot:states/2/mechanics/damage

