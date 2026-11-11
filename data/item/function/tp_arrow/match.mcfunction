# 由 do.mcfunction 调用：上下文 = 玩家，位置 = 那支箭的落点
# 四段 UUID 全等 → 就是他射的箭
scoreboard players set #tpm int 0

execute store result score #pid int run data get entity @s UUID[0]
execute if score #pid int = #u0 int run scoreboard players add #tpm int 1
execute store result score #pid int run data get entity @s UUID[1]
execute if score #pid int = #u1 int run scoreboard players add #tpm int 1
execute store result score #pid int run data get entity @s UUID[2]
execute if score #pid int = #u2 int run scoreboard players add #tpm int 1
execute store result score #pid int run data get entity @s UUID[3]
execute if score #pid int = #u3 int run scoreboard players add #tpm int 1

# 传送到箭落点上方一格（避免卡在方块里），再加一点音效
execute if score #tpm int matches 4 run tp @s ~ ~1 ~
execute if score #tpm int matches 4 run playsound minecraft:entity.enderman.teleport player @s ~ ~ ~ 1 1
