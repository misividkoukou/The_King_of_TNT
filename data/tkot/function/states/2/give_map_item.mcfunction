# ── 开局发放：地图专属物品 ──────────────────────────────────
# 由 states/2/give_item 在公共物品之后调用，只按 #map_num 判断。
# 新增地图专属物品 → 只改这个文件，不要往 give_item 里堆。
#
# 三层边界（全包统一，别再混写）：
#   ① 公共消耗品/武器 → states/2/give_item（全局发放，所有地图都一样）
#   ② 职业专属        → jobs/give_item/jobN（由 jobs/player → jobs/judge 按 job 分发）
#   ③ 地图专属        → 这里（本文件，按 #map_num 判断）

#腐朽文明特殊物品
execute if score #map_num int matches 4 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={teleport_arrow:true,game_item:true},minecraft:item_name={"text":"传送箭","color":"light_purple"},minecraft:enchantment_glint_override=true] 5
#矿洞图特殊物品
execute if score #map_num int matches 7 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:arrow[minecraft:max_stack_size=99,minecraft:custom_data={teleport_arrow:true,game_item:true},minecraft:item_name={"text":"传送箭","color":"light_purple"},minecraft:enchantment_glint_override=true] 5

execute if score #map_num int matches 7 run give @a[team=!debug,gamemode=!spectator] minecraft:ender_pearl[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"fast_pearl"},minecraft:custom_data={game_item:true},minecraft:item_name={"text":"末影珍珠","color":"light_purple"},minecraft:lore=[{"text":"降低了冷却时间","color":"gray","italic":false}],minecraft:enchantment_glint_override=true] 5

execute if score #map_num int matches 7 run tellraw @a[team=!debug,gamemode=!spectator,scores={statu=2}] {text:"特殊地图物品已经发放，省着用哦...",color:gold}
