# 调试用：手动发全部游戏道具（/function item:temp）
# ★ 这里的组件必须和战利品表/正式发放【完全一致】，否则背包里会分成两堆、或者行为和正式游戏对不上。

########################
## 普通物品（normal_item 池）
########################

# 普通弹
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"normal"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"抛射型tnt"},minecraft:lore=[{text:"大家都喜欢tnt,不是嘛..",color:"aqua"}]] 1

# 金色胡萝卜（99 堆叠 + game_item，不带光效）
give @s minecraft:golden_carrot[minecraft:max_stack_size=99,minecraft:custom_data={game_item:true}] 1

########################
## 特殊物品（special_item 池）
########################

# 瞬爆型tnt
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:2,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"instant"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"瞬爆型tnt"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"脾气不太好，碰到地上就会炸",color:"aqua"},{text:"和koukou一样",strikethrough:true,color:"yellow"}]] 1

# 多重射击tnt
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:1,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"multishot"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"多重射击tnt"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"有谁不想一口气丢几个TNT出去呢",color:"aqua"},{text:"时代少年团这一块",strikethrough:true}]] 1

# 弹跳型tnt（冷却用独立组 bounce_throw，不和普通弹抢 tnt_throw）
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:1,cooldown_group:"bounce_throw"},minecraft:custom_data={tnt:true,type:"bounce"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"弹跳型tnt"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"落地会弹起来，弹三下才认命",color:"aqua"},{text:"一蹦一跳地来炸你",color:"gray"}]] 1

# 治疗池
give @s minecraft:beacon[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:5,cooldown_group:"heal_items"},minecraft:custom_data={heal_pool:true},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:block.beacon.activate",has_consume_particles:false},minecraft:item_model="minecraft:beacon",minecraft:item_name={"text":"治疗池"},minecraft:lore=[{text:"生成一个治疗云，我活过来了...",color:"aqua"}],minecraft:enchantment_glint_override=true] 1

# 地雷（纸 + 压力板模型：纸不可放置，右键才会真正"消耗"并触发埋雷）
give @s minecraft:paper[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:1,cooldown_group:"trap_item"},minecraft:custom_data={trap_item:true,game_item:true},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:block.stone_button.click_on",has_consume_particles:false},minecraft:item_model="minecraft:heavy_weighted_pressure_plate",minecraft:item_name={"text":"地雷","color":"red"},minecraft:lore=[{text:"放置后1秒激活，踩上即炸！快跑！","color":"gray"}],minecraft:enchantment_glint_override=true] 1

# 低当量爆炸箭
give @s minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={low_exp_arrow:true,game_item:true},minecraft:item_model="minecraft:arrow",minecraft:item_name={"text":"低当量爆炸箭"},minecraft:lore=[{text:"射出去，爆炸!",color:"aqua"}],minecraft:enchantment_glint_override=true] 4

# 大当量爆炸箭
give @s minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={high_exp_arrow:true,game_item:true},minecraft:item_model="minecraft:arrow",minecraft:item_name={"text":"大当量爆炸箭"},minecraft:lore=[{text:"射出去，爆炸!",color:"aqua"}],minecraft:enchantment_glint_override=true] 2

# 传送箭（射出去落地后把自己传到落点）
give @s minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={teleport_arrow:true,game_item:true},minecraft:item_name={"text":"传送箭","color":"light_purple"},minecraft:enchantment_glint_override=true] 4

# 风弹（真正的风弹物品，右键正常使用）
give @s minecraft:wind_charge[minecraft:max_stack_size=99,minecraft:custom_data={game_item:true},minecraft:item_name={"text":"风弹"},minecraft:lore=[{text:"就是风弹",color:"aqua"},{text:"丹丹",strikethrough:true}],minecraft:enchantment_glint_override=true] 8

# 末影珍珠（降低冷却版）
give @s minecraft:ender_pearl[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"fast_pearl"},minecraft:custom_data={game_item:true},minecraft:item_name={"text":"末影珍珠","color":"light_purple"},minecraft:lore=[{"text":"降低了冷却时间","color":"gray","italic":false}],minecraft:enchantment_glint_override=true] 1

########################
## 开局直接发的装备（states/2/give_item）
########################

# 弩
give @s minecraft:crossbow[unbreakable={},minecraft:custom_data={crossbow:true,game_item:true},minecraft:item_name={"text":"永恒之驽"},minecraft:item_model="minecraft:crossbow",minecraft:lore=[{text:"实际上箭类物品都需要用我打出去!",color:"aqua"}]]

# 击退棒
give @s minecraft:stick[minecraft:enchantments={"minecraft:knockback":1},minecraft:custom_data={knockback_stick:true,game_item:true},minecraft:item_name={"text":"击退棒","color":"gold","bold":true},minecraft:enchantment_glint_override=true] 1
