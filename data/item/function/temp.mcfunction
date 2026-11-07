# 调试用：手动发弹药（/function item:temp）

# 普通弹
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"normal"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"抛射型tnt"},minecraft:lore=[{text:"大家都喜欢tnt,不是嘛..",color:"aqua"}]] 1

# 瞬爆弹
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:8,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"instant"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"瞬爆型tnt"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"脾气不太好，碰到地上就会炸",color:"aqua"},{text:"和koukou一样",strikethrough:true,color:"yellow"}]] 1

# 多重射击弹
give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:1,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"multishot"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"多重射击tnt"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"有谁不想一口气丢几个TNT出去呢",color:"aqua"},{text:"时代少年团这一块",strikethrough:true}]] 1

# 治疗池
give @s minecraft:beacon[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:5,cooldown_group:"heal_items"},minecraft:custom_data={heal_pool:true},minecraft:consumable={consume_seconds:0,animation:"none",sound:"block.beacon.activate",has_consume_particles:false},minecraft:item_model="minecraft:beacon",minecraft:item_name={"text":"治疗池"},minecraft:lore=[{text:"生成一个治疗云，我活过来了...",color:"aqua"}],minecraft:enchantment_glint_override=true] 1

# 飞行羽毛
give @s minecraft:feather[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:10,cooldown_group:"fly_feather"},minecraft:custom_data={fly_feather:true},minecraft:consumable={consume_seconds:0,animation:"none",has_consume_particles:false},minecraft:item_model="minecraft:feather",minecraft:item_name={"text":"飞行羽毛"},minecraft:lore=[{text:"短暂改变你的重力方向",color:"aqua"},{text:"厉害吗你坤哥的毛",strikethrough:true}],minecraft:enchantment_glint_override=true] 1
