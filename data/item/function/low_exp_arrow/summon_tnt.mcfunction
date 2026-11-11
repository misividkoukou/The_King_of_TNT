# 爆炸箭：插到地面时在箭的位置炸一颗 TNT

# 1. 在箭位置召唤 TNT（fuse:0 = 下一 tick 立即引爆）
#    落地判定用箭自己的 inGround，不是实体基类的 OnGround。
#    实测：箭插在地上时 inGround:1b，而 OnGround 一直是 0b。
#    注意 NBT 里不能有尾随逗号（{fuse:0,Tags:[...],} 会让整条 summon 解析失败）
execute as @e[type=arrow,tag=low_exp_arrow,nbt={inGround:1b}] at @s run summon minecraft:tnt ~ ~ ~ {fuse:0,Tags:["low_exp_arrow_tnt"],explosion_power:2}

# 2. 把箭的 Owner 直接复制给刚生成的 TNT
execute as @e[type=arrow,tag=low_exp_arrow,nbt={inGround:1b}] at @s run data modify entity @e[type=tnt,tag=low_exp_arrow_tnt,distance=..1,limit=1,sort=nearest] owner set from entity @s Owner

# 3. 清除箭，防止重复触发
# ★ 这一行原来少了开头的 "kill @e[["，只剩半截：
#   type=arrow,tag=low_exp_arrow,nbt={inGround:1b}]
#   → 语法错误 → 箭永远不被删除 → 每 tick 都在同一位置再召一颗 TNT，无限爆炸
kill @e[type=arrow,tag=low_exp_arrow,nbt={inGround:1b}]
