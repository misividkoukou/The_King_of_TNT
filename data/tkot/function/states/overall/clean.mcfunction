# 掉落物清理：清掉所有没有 game_item 实体标签的物品实体
# 由 ticks/sec1 调用，但**战斗进行中不清理**（#steps == 2 时跳过）——
# 玩家丢在地上的道具要保留到本局结束，方便打完再捡。
# 回合结束时由 states/reset 统一清掉场地内的掉落物。
#
# 注意：这里的 tag 是【实体标签】，不是物品的 custom_data。
#       所以默认情况下所有掉落物都会被清掉，除非掉落时手动加了 game_item 标签。

kill @e[type=item,tag=!game_item]
