# 掉落物清理：清掉所有没有 tkot_keep 标签的物品实体
# 由 ticks/sec1 每秒调用一次（不要每 tick 调，那是 20 倍的全实体扫描）
# 以后游戏自己刷在地面上的奖励物品，记得打上 Tags:["tkot_keep"]
kill @e[type=item,tag=!tkot_keep]
