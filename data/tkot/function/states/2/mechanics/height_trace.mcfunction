# 虚空兜底：只对“本局还活着”（statu=2）生效，已淘汰转观战的玩家不受影响。
#
# 现在真正的判死线是场地盒的下沿 y=-10（见 maps/map1_spectate），
# 这里只作为“掉穿世界”的最后一道保险：y -64 ~ -11。
execute as @a[scores={statu=2},team=!debug] at @s if entity @s[x=0,y=-64,z=-48,dx=48,dy=54,dz=48] run function tkot:states/2/mechanics/damage
