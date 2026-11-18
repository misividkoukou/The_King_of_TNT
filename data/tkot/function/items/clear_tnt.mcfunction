# ── 清掉本数据包发放的所有道具（玩家背包）──
# 文件名沿用 clear_tnt，但实际处理的是【全部游戏道具】。
#
# 全部按 custom_data 精确识别，不会误删玩家自己的同种普通物品。
# 新增道具时记得在这里加一行，否则大厅里清不掉。
# 地面掉落物不在这里处理：战斗结束后由 states/reset 统一清。

# 普通 / 瞬爆 / 多重射击 TNT / 击退棒
clear @a[team=!debug] minecraft:stick[minecraft:custom_data~{tnt:true}]
clear @a[team=!debug] minecraft:stick[minecraft:custom_data~{knockback_stick:true}]
# 治疗池（信标）
clear @a[team=!debug] minecraft:beacon[minecraft:custom_data~{heal_pool:true}]
# 爆炸箭（两种威力各自一个标记）+ 传送箭
clear @a[team=!debug] minecraft:arrow[minecraft:custom_data~{low_exp_arrow:true}]
clear @a[team=!debug] minecraft:arrow[minecraft:custom_data~{high_exp_arrow:true}]
clear @a[team=!debug] minecraft:arrow[minecraft:custom_data~{teleport_arrow:true}]
# 地雷（纸 + 压力板模型：纸不可放置，右键才会真正"消耗"并触发埋雷）
clear @a[team=!debug] minecraft:paper[minecraft:custom_data~{trap_item:true}]
# 风弹
clear @a[team=!debug] minecraft:wind_charge[minecraft:custom_data~{game_item:true}]
# 末影珍珠
clear @a[team=!debug] minecraft:ender_pearl[minecraft:custom_data~{game_item:true}]
# 金色胡萝卜（游戏发的都带 game_item 标记）
clear @a[team=!debug] minecraft:golden_carrot[minecraft:custom_data~{game_item:true}]
