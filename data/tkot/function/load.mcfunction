##PLAYERS##
#玩家互动
# 预留：目前全包没有任何地方读写 tkot.trigger。以后做交互/GUI 触发时再放开这两行。
# scoreboard objectives remove tkot.trigger
# scoreboard objectives add tkot.trigger trigger "交互"

#玩家单局处理
# 必须先 remove 再 add：如果这个计分板以前以别的类型（比如 dummy）存在过，
# 单靠 add 会静默失败，类型就永远卡在旧值上，deathCount 也就永远不会自增。
# death 是单局数据（每局开始都会清零），所以这里删掉是安全的。
tellraw @a [{text:"TKOT Minigame 为了Areocraft服务器开发，适配26.3+版本\n",color:aqua},{text:"作者:misivid_koukou",color:green},{text:"版本v0.2.0"},{text:"详细更新报告前往bilibili",color:"aqua"}]

scoreboard objectives remove death
scoreboard objectives add death deathCount "死亡次数"

scoreboard objectives remove spawn_point 
scoreboard objectives add spawn_point dummy "出生点"


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

# 事件投票用的 trigger 计分板：给非 OP 玩家点聊天按钮用
# （trigger 类型只能由玩家自己用 /trigger 改，权限交给 enable/disable 控制）
scoreboard objectives remove vote
scoreboard objectives add vote trigger "事件投票"

# 模式告示牌用的 trigger 计分板（click_event 只能跑 trigger 才不要求 OP）
scoreboard objectives remove mode_set
scoreboard objectives add mode_set trigger "模式选择"

# 事件总表（名称/颜色/事件函数/数量）——加事件只改这个文件
function tkot:events/player/table

team remove debug
team add debug "调试者"

##队伍（组队模式用）
# #gamemode int：1 = 单人混战（默认）  2 = 系统分组  3 = 自选分组
# 只做底层，不做切换界面；管理员用 /scoreboard players set #gamemode int N 切换
# ★ 故意做成每次 /reload 都强制回到 1：重载=把一切恢复默认，避免残留一个奇怪的模式
scoreboard players set #gamemode int 1

# 四支队伍：红 / 黄 / 蓝 / 绿
#   friendlyFire false          = 队友之间打不到（近战、箭都不行），但**爆炸伤害不受这个限制**
#   seeFriendlyInvisibles true  = 队友隐身时自己仍能看见（这就是你要的"看得到相互的隐身"）
team remove red
team add red "红队"
team modify red color red
team modify red friendlyFire false
team modify red seeFriendlyInvisibles true
team modify red prefix {"text":"[红] ","color":"red"}

team remove yellow
team add yellow "黄队"
team modify yellow color yellow
team modify yellow friendlyFire false
team modify yellow seeFriendlyInvisibles true
team modify yellow prefix {"text":"[黄] ","color":"yellow"}

team remove blue
team add blue "蓝队"
team modify blue color blue
team modify blue friendlyFire false
team modify blue seeFriendlyInvisibles true
team modify blue prefix {"text":"[蓝] ","color":"blue"}

team remove green
team add green "绿队"
team modify green color green
team modify green friendlyFire false
team modify green seeFriendlyInvisibles true
team modify green prefix {"text":"[绿] ","color":"green"}

##游戏规则

gamerule immediate_respawn true
# 禁止怪物自然生成：昼夜交替时不会突然刷怪,地图一会自动开启
gamerule spawn_monsters false
# 大厅默认禁止互殴；开战时由 states/1/next_statu 打开，结算时关回
gamerule pvp false
# 禁止下界传送门
# 注意：gamerule 名不带命名空间前缀；原来那行写成 minecraft:... 会被拒，
# 下面那行是裸查询（只打印值），已合并成一条正确的设置命令
gamerule allow_entering_nether_using_portals false
gamerule block_drops false
gamerule entity_drops false
gamerule locator_bar false
gamerule mob_drops false
gamerule spawn_patrols false
gamerule spawn_phantoms false
gamerule spawn_wandering_traders false
gamerule spread_vines false
gamerule advance_weather false
weather clear



gamemode adventure @a[team=!debug]

#初始化
scoreboard players set #steps int 0
scoreboard players set #prepare sec -1
scoreboard players set #lobby_cd int 0
# 结算后"5 秒延迟回大厅"的开关：1 = 还在延迟中
scoreboard players set #over_wait int 0
# ★ 三个计时器必须在这里就初始化成 0（不能用 reset）：
#   reload 后如果它们不存在，roll_core 的 matches 判断全部失效，
#   随机事件会被跳过、#events 用旧值 → 开局就重放上一局的最后一个事件。
scoreboard players set #game_min_timer int 0
scoreboard players set #game_sec_timer int 0
scoreboard players set #game_event_timer int 0
scoreboard players set #event_fire int 0
# "玩家不足"提示的节流计数（秒）
scoreboard players set #cancel_cd int 0
# ★ 投票/事件状态也必须初始化为 0：
#   #vote_ready 不存在时，announce 里 matches 1 和 matches 0 都不成立 → 一条消息都不发。
scoreboard players set #vote_ready int 0
scoreboard players set #vote_total int 0
scoreboard players set #next_event int 0
scoreboard players set #vote_opened int 0
scoreboard players set #rollmax int 0
# 边界"耗尽"标记 + 边界事件编号 + 上一次读到的边界尺寸
scoreboard players set #border_dead int 0
scoreboard players set #border_id int 0
scoreboard players set #border_range int 0
scoreboard players set @a statu 0

title @a clear
# 大厅常驻强加载：place template 需要目标区块已加载
# 注意：forceload 用的是【方块坐标】(x1 z1 x2 z2)，不是区块坐标！
# 大厅区域 x 0..47 / z 200..247 → 对应区块 (0..2, 12..15)
forceload add 0 200 47 247

# 复位大厅：必须延后一 tick —— forceload 刚加上的区块要下一 tick 才真正加载，
# 同一个 tick 里 place template 会报“区块未加载”
schedule function tkot:lobby/place_lobby 2t replace

# 大厅放好之后再统一传送：place_lobby 现在只放结构、不负责传送。
# 延到 3t 是因为 #lobby_ok 要等它 2t 执行时才写入，而 tp_all 依赖它。
schedule function tkot:lobby/tp_all 3t replace

schedule function tkot:ticks/tick1 1t replace
schedule function tkot:ticks/sec1 1t replace

# 每 3 秒补一次普通物资（ticks/sec3 自己续期，这里只负责第一次启动）
schedule function tkot:ticks/sec3 3s replace

# 每 15 秒的事件轮询（ticks/sec15 会自己续期，这里只负责第一次启动）
schedule function tkot:ticks/sec15 1t replace