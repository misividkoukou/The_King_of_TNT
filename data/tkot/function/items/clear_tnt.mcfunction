# ── 清掉本数据包发放的所有道具（玩家背包）──
# 文件名沿用 clear_tnt，但实际处理的是【全部游戏道具】。
#
# 全部按 custom_data 精确识别，不会误删玩家自己的同种普通物品。
# 地面掉落物不在这里处理：states/overall/clean 每秒会清掉所有 tag=!tkot_keep 的物品实体。

# 普通 / 瞬爆 / 多重射击 TNT
clear @a[team=!debug] minecraft:stick[minecraft:custom_data~{tnt:true}]
# 治疗池（信标）
clear @a[team=!debug] minecraft:beacon[minecraft:custom_data~{heal_pool:true}]
# 飞行羽毛
clear @a[team=!debug] minecraft:feather[minecraft:custom_data~{fly_feather:true}]
# 爆炸箭
clear @a[team=!debug] minecraft:arrow[minecraft:custom_data~{exp_arrow:true}]
# 金色胡萝卜（游戏发的都带 game_item 标记，见 spread / loot_table/normal_item）
clear @a[team=!debug] minecraft:golden_carrot[minecraft:custom_data~{game_item:true}]
