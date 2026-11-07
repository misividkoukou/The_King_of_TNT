# 地图 48*48*48 的场地判定与边界
# 包围盒：x 0..47，y 0..60，z -48..-1（与结构模板同尺寸，y 多留 13 格给观战者）
# 大厅在 x 0..47 / z 200..247 / y -56 起，z 方向完全不相交，不会误判。

# 重算 in_arena（这是位置状态，不是身份，所以仍然用 tag）
execute as @a at @s if entity @s[x=0,y=0,z=-48,dx=48,dy=61,dz=48] run tag @s add in_arena
execute as @a at @s unless entity @s[x=0,y=0,z=-48,dx=48,dy=61,dz=48] run tag @s remove in_arena

# 边界：本局存活（statu=2）离开场地 → 判死。
# 以后做缩圈，就是把上面的包围盒逐圈改小，这条不用动。
execute as @a[scores={statu=2},tag=!in_arena] run function tkot:states/2/mechanics/damage

# 注意：观战者（statu 3/4）【不再】被拉回场地 —— 他们可以自由飞行观战。
# 以前这里有一条「出界就 tp 回观察点 (x, y_debug, z)」的限制，已移除。
