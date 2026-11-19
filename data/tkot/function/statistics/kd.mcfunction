# ── 计算 K/D（上下文 = 玩家，保留一位小数）──
# 结果写进两个临时计分板：
#   kd      = 整数部分
#   kd_frac = 小数部分（0..9），显示时拼成 <kd>.<kd_frac>
# 例：kill=7 death=3 → 7*10/3=23 → kd=2、kd_frac=3 → "2.3"
#
# ★ 用整数运算做小数：先 ×10 再除，避免浮点；
#   没人死亡（total.death 不存在或为 0）时【整段跳过】，不做除法也不写值，
#   由调用方决定显示成 "—"，因此不会出现除零。
# ★ 调用方负责：设置 #const_10 int = 10，用完清掉 kd / kd_frac / #const_10。

scoreboard players set @s kd 0
scoreboard players set @s kd_frac 0

execute if score @s total.death matches 1.. run scoreboard players operation @s kd = @s total.kill
execute if score @s total.death matches 1.. run scoreboard players operation @s kd *= #const_10 int
execute if score @s total.death matches 1.. run scoreboard players operation @s kd /= @s total.death

# 小数部分：取余 10，然后整数部分整除掉那一位
execute if score @s total.death matches 1.. run scoreboard players operation @s kd_frac = @s kd
execute if score @s total.death matches 1.. run scoreboard players operation @s kd_frac %= #const_10 int
execute if score @s total.death matches 1.. run scoreboard players operation @s kd /= #const_10 int
