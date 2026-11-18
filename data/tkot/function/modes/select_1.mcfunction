# 模式 1：单人混战
# 现在处于准备阶段，分队是在开局瞬间（states/0/next_statu → teams/prepare）执行的，
# 所以这里改完就是【本局】生效。
scoreboard players set #gamemode int 1
tellraw @a [{"text":"[TKOT] 模式已切换为 ","color":"gold"},{"text":"单人混战","color":"yellow"}]
playsound minecraft:block.note_block.pling master @a
