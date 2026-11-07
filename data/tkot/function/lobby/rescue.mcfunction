# ── 掉出大厅兜底 ──
# 只由 states/overall/tick1 在 大厅/准备阶段（#steps 0、1）调用。
#
# 判定用【位置】而不是【死亡】：
#   传送兜底会让玩家死不了，所以“死亡 → 复位大厅”这条路永远不会触发。
#
# 包围盒下沿取 -56（大厅地板）而不是 -64：
#   掉进洞的人掉到 -57 时，如果用 y=-64 的盒子，他仍然算“在盒子里”，就检测不到了。
#   取 -56 之后，「掉到地板以下」和「从侧面走出去」都会被判成掉出。
#   以后把大厅改到别的深度，这里的 -56 和 tp_point 的坐标要一起改。
execute as @a[scores={statu=0..1},team=!debug] at @s unless entity @s[x=0,y=-56,z=200,dx=48,dy=64,dz=48] run tag @s add out_lobby

# ① 先修大厅 —— 必须在传送之前，否则人会被放回同一个洞上，下一 tick 又掉下去
#    冷却 #lobby_cd：place_lobby 成功时设 60，洞里卡着时不会每 tick 重放一次结构
scoreboard players remove #lobby_cd int 1
execute if entity @a[tag=out_lobby] if score #lobby_cd int matches ..0 run function tkot:lobby/place_lobby

# ② 再把人送回大厅
execute as @a[tag=out_lobby] run function tkot:lobby/tp_point
execute as @a[tag=out_lobby] run tag @s remove out_lobby
