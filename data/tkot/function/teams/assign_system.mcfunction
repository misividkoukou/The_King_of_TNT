# ── 模式 2：系统分组 ──
# 先把所有人清出队伍，然后按 红→黄→蓝→绿 轮流分配（人数差 ≤ 1）
function tkot:teams/clear

scoreboard players set #ti int 0
# ★ 注意用 statu=1..2：teams/prepare 是在 statu 已经变成 2 之后才调用的，
#   只写 statu=1 会导致一个人都匹配不到、所有人都没队伍。
tag @a remove tm_done
execute as @a[team=!debug,scores={statu=1..2},tag=!tm_done,limit=1] run function tkot:teams/assign_one

