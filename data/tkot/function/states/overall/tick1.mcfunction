# ── 全局玩家状态，每 tick 一次，任何阶段都跑 ──

# 1. 第一次进服的玩家：初始化 + 引导
execute as @a[tag=!joined] run function tkot:states/overall/first_join

# 2. 掉线重连 / 旧局残留身份校验
#    规则：只有“本局”才算参战。statu=2/3 的人的 round 必须等于 #round，否则一律作废回大厅。
#    这样“第 3 局掉线、第 5 局才回来”的人不会被当成还在打。
execute as @a[scores={statu=2..3}] unless score @s round = #round int run scoreboard players set @s statu 0
execute as @a[scores={statu=0},gamemode=spectator] run gamemode adventure @s

# 3. 掉出世界兜底：y 低于大厅地板（-56）的人直接送回大厅，
#    防止“死亡 → 重生到老出生点 → 再掉进虚空”的死循环
execute as @a[y=-64,dy=9] run function tkot:lobby/tp_self

# 4. 只有战斗进行中才处理“场内 / 观战 / 边界”这套逻辑
execute if score #steps int matches 2 run function tkot:states/overall/in_game
