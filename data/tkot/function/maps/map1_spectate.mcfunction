# 地图 48*48*48 的场地判定与边界
# 判定盒：x 0..47，y -10..60，z -48..-1
#   ★ 下沿特意放到 -10：玩家掉到 y=-10 才判死，掉进地图里的深坑/低洼不会立刻死。
# 大厅在 x 0..47 / z 200..247 / y -56 起，z 方向完全不相交，不会误判。

# 重算 in_arena（这是位置状态，不是身份，所以仍然用 tag）
execute as @a at @s if entity @s[x=0,y=-10,z=-48,dx=48,dy=71,dz=48] run tag @s add in_arena
execute as @a at @s unless entity @s[x=0,y=-10,z=-48,dx=48,dy=71,dz=48] run tag @s remove in_arena

# 边界：本局存活（statu=2）离开场地 → 判死（掉到 -10 以下、或飞出水平范围）。
# 以后做缩圈，就是把上面的判定盒逐圈改小，这条不用动。
execute as @a[scores={statu=2},tag=!in_arena] run function tkot:states/2/mechanics/damage

# ── 观战者活动范围（比场地宽松很多，但不能无限飞）──
# 水平：场地向外各放宽 30 格 → x -30..77 / z -78..29
# 竖直：-64 ~ 318
# 超出这个范围才会被拉回观察点 (x, y_debug, z)。
# team=!debug：调试队不受限。
$execute as @a[scores={statu=3..4},team=!debug] at @s unless entity @s[x=-30,y=-64,z=-78,dx=108,dy=383,dz=108] run tp @s $(x) $(y_debug) $(z)
