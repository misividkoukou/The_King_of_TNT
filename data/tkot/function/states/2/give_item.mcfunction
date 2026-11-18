#Game Intro
tellraw @a [{"text":"--------------------------------","color":"gold","bold":true},{"text":"\n"},{"text":" TNT之王","color":"dark_green","bold":true},{"text":"\n"},{"text":"使用道具将其他玩家炸死或者丢入虚空吧，不准炸koukou :(","bold":true},{"text":"\n"},{"text":"--------------------------------","color":"gold","bold":true}]

# 只在战斗阶段发放。
give @a[team=!debug,gamemode=!spectator] minecraft:crossbow[unbreakable={},minecraft:custom_data={crossbow:true,game_item:true},minecraft:item_name={"text":"永恒之驽"},minecraft:item_model="minecraft:crossbow",minecraft:lore=[{text:"实际上箭类物品都需要用我打出去!",color:"aqua"}]]

# 发完武器立刻发职业道具（每局一次；没选职业的人什么都不发）
function tkot:jobs/player

# 击退棒已经改成特殊物品（special_item 战利品表，权重 1），这里不再直接发

#   统一写法：golden_carrot[max_stack_size=99, custom_data={game_item:true}]
give @a[team=!debug,gamemode=!spectator,scores={statu=2}] golden_carrot[minecraft:max_stack_size=99,minecraft:custom_data={game_item:true}] 5
#腐朽文明特殊物品
execute if score #map_num int matches 4 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={teleport_arrow:true,game_item:true},minecraft:item_name={"text":"传送箭","color":"light_purple"},minecraft:enchantment_glint_override=true] 5
#矿洞图特殊物品
execute if score #map_num int matches 7 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={teleport_arrow:true,game_item:true},minecraft:item_name={"text":"传送箭","color":"light_purple"},minecraft:enchantment_glint_override=true] 5

execute if score #map_num int matches 7 run give @a[team=!debug,gamemode=!spectator] minecraft:ender_pearl[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"fast_pearl"},minecraft:custom_data={game_item:true},minecraft:item_name={"text":"末影珍珠","color":"light_purple"},minecraft:lore=[{"text":"降低了冷却时间","color":"gray","italic":false}],minecraft:enchantment_glint_override=true] 5

execute if score #map_num int matches 7 run tellraw @a[team=!debug,gamemode=!spectator,scores={statu=2}] {text:"特殊地图物品已经发放，省着用哦...",color:gold}

execute as @a[team=!debug,gamemode=!spectator] run loot give @s loot tkot:normal_item

effect give @a night_vision infinite 1 true
