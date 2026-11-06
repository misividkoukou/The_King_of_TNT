##PLAYERS##
#玩家互动
scoreboard objectives remove tkot.trigger
scoreboard objectives add tkot.trigger trigger "交互"

#玩家单局处理
# 必须先 remove 再 add：如果这个计分板以前以别的类型（比如 dummy）存在过，
# 单靠 add 会静默失败，类型就永远卡在旧值上，deathCount 也就永远不会自增。
# death 是单局数据（每局开始都会清零），所以这里删掉是安全的。
scoreboard objectives remove death
scoreboard objectives add death deathCount "死亡次数"


#玩家总体处理
scoreboard objectives add statu dummy "玩家所处阶段"
scoreboard objectives add round dummy "玩家参与的局数"
scoreboard objectives add player_round dummy "玩家参与次数"
scoreboard objectives add player_win dummy "玩家胜利次数"
scoreboard objectives add total.death dummy "总死亡次数"

##GAME##

scoreboard objectives remove int
scoreboard objectives add int dummy


scoreboard objectives remove sec
scoreboard objectives add sec dummy "秒"

scoreboard objectives remove min
scoreboard objectives add min dummy "分"

team remove debug
team add debug "调试者"
#游戏规则

gamerule immediate_respawn true
gamemode adventure @a[team=!debug]

#初始化
scoreboard players set #steps int 0
scoreboard players set #prepare sec -1
scoreboard players set @a statu 0

# 大厅常驻强加载：place template 需要目标区块已加载
# 注意：forceload 用的是【方块坐标】(x1 z1 x2 z2)，不是区块坐标！
# 大厅区域 x 0..47 / z 200..247 → 对应区块 (0..2, 12..15)
forceload add 0 200 47 247

# 复位大厅：必须延后一 tick —— forceload 刚加上的区块要下一 tick 才真正加载，
# 同一个 tick 里 place template 会报“区块未加载”
schedule function tkot:states/3/place_lobby 2t replace

# 注意：这里【不要】直接 tp —— 上面 remove int 已经把 #lobby_ok 清空，
# 而大厅要塞两 tick 后才放得回去。传送统一交给 place_lobby，它在放成功后调 tp_all。

schedule function tkot:ticks/tick1 1t replace
schedule function tkot:ticks/sec1 1s replace