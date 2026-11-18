 #箭不再有伤害
execute as @e[type=arrow,tag=low_exp_arrow] run data modify entity @s damage set value 0
execute as @e[type=arrow,tag=high_exp_arrow] run data modify entity @s damage set value 0