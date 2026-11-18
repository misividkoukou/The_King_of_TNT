# 1. 为场上所有玩家生成一个"位置记录点"（隐形盔甲架）
execute as @a[gamemode=!spectator,scores={statu=2}] at @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["swap_pos"],Marker:1b,Invisible:1b,NoGravity:1b}

# 2. 遍历所有玩家，依次执行换位逻辑（串行执行，天然防冲突）
# ★ 必须带 at @s：change 里的 distance=0.1.. 是相对"执行位置"算的，
#   只写 as @s 的话执行位置还是命令源（0,0,0），"排除自己脚下"就完全失效。
execute as @a[gamemode=!spectator,scores={statu=2}] at @s run function tkot:events/game/change_position/change

# 3. 清理可能因为人数为单数等原因残留的记录点
kill @e[type=armor_stand,tag=swap_pos]
