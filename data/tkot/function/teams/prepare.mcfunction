# ── 开局前分好队（由 states/0/next_statu 在倒计时结束时调用）──
#
#   #gamemode 1 = 单人混战：清空队伍，谁都不属于任何队
#   #gamemode 2 = 系统分组：按红→黄→蓝→绿轮流分配
#   #gamemode 3 = 自选分组：保留玩家站台选好的队，平衡人数差；
#                如果最终只有 0~1 支队伍，自动回退成系统分组

# 模式 1/2 先清空；模式 3 不能清，否则会把玩家自己选好的队抹掉
execute if score #gamemode int matches 1..2 run function tkot:teams/clear

execute if score #gamemode int matches 2 run function tkot:teams/assign_system
execute if score #gamemode int matches 3 run function tkot:teams/balance
execute if score #gamemode int matches 3 run function tkot:teams/fallback_check

tag @a remove tm_done
