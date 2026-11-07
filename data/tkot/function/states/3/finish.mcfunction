tellraw @a [{"text":"胜利者：","color":"gold"},{"selector":"@a[scores={statu=2}]","color":"green"},{"text":" —— 已回到大厅，地图正在复位","color":"gray"}]
playsound entity.player.levelup master @a

# ── 收尾：卸强加载 → 回合复位 → 放开状态机 ──
# 注意：上面这几行必须写在 states/reset 之前 —— reset 会把所有人 statu 归 0，
# 之后就选不出胜利者了。

# 卸强加载（必须和 maps/pick 里 add 的那组完全一致，否则卸不掉）
# 所有 48×48 的地图共用同一片场地，所以这里不需要按地图号区分
forceload remove 0 -48 47 -1

function tkot:states/reset
scoreboard players set #steps int 0

# 最后再保一次：结算瞬间正在重生的玩家可能错过前面的传送，这里收尾补上
# 必须用 tp_all（内部是 as @a）：finish 是 schedule 链条里执行的，没有实体上下文，tp @s 会静默失败
function tkot:lobby/tp_all

# 回大厅再清一次背包：结算那一刻可能还有一条已排队的 give_item 刚执行完
clear @a

tellraw @a {"text":"地图已复位，可以开始新一轮了","color":"green"}
playsound entity.villager.yes master @a
