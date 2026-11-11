# 由 tp.mcfunction 调用：上下文 = 那支传送箭，位置 = 箭的位置
# 1. 把箭的主人 UUID 的 4 段存进计分板
execute store result score #u0 int run data get entity @s Owner[0]
execute store result score #u1 int run data get entity @s Owner[1]
execute store result score #u2 int run data get entity @s Owner[2]
execute store result score #u3 int run data get entity @s Owner[3]

# 2. 让每个玩家自己比对（注意：execute as 不改变位置，所以 match 里的 ~ ~ ~ 仍是箭的位置）
execute as @a[gamemode=!spectator] run function item:tp_arrow/match

# 3. 这支箭用完了
kill @s
