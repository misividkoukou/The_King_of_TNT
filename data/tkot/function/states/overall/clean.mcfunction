# 掉落物清理：清掉所有没有 tkot_keep 标签的物品实体
# 由 ticks/sec1 每秒调用一次（不要每 tick 调，那是 20 倍的全实体扫描）
# 只要是gameitem不删就好了
kill @e[type=item,tag=!game_item]
