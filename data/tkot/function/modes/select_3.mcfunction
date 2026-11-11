# 模式 3：自选分组
# 本局生效：分队在开局瞬间执行（states/0/next_statu → teams/prepare）
scoreboard players set #gamemode int 3
tellraw @a [{"text":"[TKOT] 模式已切换为 ","color":"gold"},{"text":"自选分组","color":"yellow"}]
playsound minecraft:block.note_block.pling master @a
