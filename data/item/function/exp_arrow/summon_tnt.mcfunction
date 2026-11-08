# 爆炸箭：插到地面时在箭的位置炸一颗 TNT

# 1. 在箭位置召唤 TNT（fuse:0 = 下一 tick 立即引爆）
#    落地判定用箭自己的 inGround，不是实体基类的 OnGround。
#    实测：箭插在地上时 inGround:1b，而 OnGround 一直是 0b。
#    注意 NBT 里不能有尾随逗号（{fuse:0,Tags:[...],} 会让整条 summon 解析失败）
execute as @e[type=arrow,tag=exp_bow,nbt={inGround:1b}] at @s run summon minecraft:tnt ~ ~ ~ {fuse:0,Tags:["exp_arrow_tnt"],explosion_power:1}

# 2. 把箭的 Owner 直接复制给刚生成的 TNT
execute as @e[type=arrow,tag=exp_bow,nbt={inGround:1b}] at @s run data modify entity @e[type=tnt,tag=exp_arrow_tnt,distance=..1,limit=1,sort=nearest] owner set from entity @s Owner

# 3. 清除箭，防止重复触发
kill @e[type=arrow,tag=exp_bow,nbt={inGround:1b}]
