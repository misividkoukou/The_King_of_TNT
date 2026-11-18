tellraw @a {text:"已经到了最小咯,赠送一次event机会",color:red}

# ★ 边界已经缩到最小：之后这个事件彻底作废
#   #border_dead = 1 之后：
#     · roll 会把"边界收缩"从随机里排除（按表里的 border 编号，不依赖位置）
#     · random 会把投给"边界收缩"的票作废（否则投票能绕过排除、导致 end→random→end 递归）
scoreboard players set #border_dead int 1

# 清掉投票标记，保证这次"赠送"一定走随机且排除边界
scoreboard players set #vote_ready int 0

function tkot:events/game/random
