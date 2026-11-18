# ── 全局玩家状态，每 tick 一次，任何阶段都跑 ──

# 1. 第一次进服的玩家：初始化 + 引导
execute as @a[tag=!joined] run function tkot:states/overall/first_join

# 2. 掉线重连 / 旧局残留身份校验
#    规则：只有“本局”才算参战。statu=2/3 的人的 round 必须等于 #round，否则一律作废回大厅。
#    这样“第 3 局掉线、第 5 局才回来”的人不会被当成还在打。
execute as @a[scores={statu=2..3}] unless score @s round = #round int run scoreboard players set @s statu 0
execute as @a[scores={statu=0},gamemode=spectator] run gamemode adventure @s

# 2.5 中途重连补记参与：本局身份仍有效（statu 2/3），但身上没有 round_counted
#     正常开战时 states/1/next_statu 会统一 +1 并打标记；这里只兜"开场掉线、开战后才回来"的漏网者。
#     round_counted 只在开局/回合复位时统一清，所以一个人一局最多被补记一次。
execute if score #steps int matches 2 as @a[scores={statu=2..3},tag=!round_counted] run function tkot:states/overall/round_count

# 3. 掉出大厅兜底（位置判定）：先修大厅、再传送。
#    不能靠死亡判定 —— 传送兜底让玩家死不了，那条路永远不触发。
#    只在 大厅/准备阶段 跑：战斗中 statu 0/1 已被 in_game 转成观战，
#    而且调试队会待在 y_debug 观察点（在大厅盒外），不能被拽回来。
execute if score #steps int matches 0..1 run function tkot:lobby/rescue

# 4. 只有战斗进行中才处理“场内 / 观战 / 边界”这套逻辑
execute if score #steps int matches 2 run function tkot:states/overall/in_game

# 掉落物清理已挪到 ticks/sec1（每秒一次），不再每 tick 跑