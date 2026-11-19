# ── 开局发放：公共物品 ──────────────────────────────────────
# 三层边界（全包统一，别再混写）：
#   ① 公共消耗品/武器 → 本文件（全局发放，所有地图都一样）
#   ② 职业专属        → jobs/give_item/jobN（由 jobs/player → jobs/judge 按 job 分发）
#   ③ 地图专属        → states/2/give_map_item（按 #map_num 判断）
# 新增物品时先想清楚属于哪一层，别把地图/职业专属的东西写到这里。
#Game Intro
tellraw @a [{"text":"--------------------------------","color":"gold","bold":true},{"text":"\n"},{"text":" TNT之王","color":"dark_green","bold":true},{"text":"\n"},{"text":"使用道具将其他玩家炸死或者丢入虚空吧，不准炸koukou :(","bold":true},{"text":"\n"},{"text":"--------------------------------","color":"gold","bold":true}]

# 只在战斗阶段发放。
give @a[team=!debug,gamemode=!spectator] minecraft:crossbow[unbreakable={},minecraft:custom_data={crossbow:true,game_item:true},minecraft:item_name={"text":"永恒之驽"},minecraft:item_model="minecraft:crossbow",minecraft:lore=[{text:"实际上箭类物品都需要用我打出去!",color:"aqua"}]]

# 发完武器立刻发职业道具（每局一次；没选职业的人什么都不发）
function tkot:jobs/player

# 击退棒已经改成特殊物品（special_item 战利品表，权重 1），这里不再直接发

#   统一写法：golden_carrot[max_stack_size=99, custom_data={game_item:true}]
give @a[team=!debug,gamemode=!spectator,scores={statu=2}] golden_carrot[minecraft:max_stack_size=99,minecraft:custom_data={game_item:true}] 5
# 地图专属物品（腐朽文明 / 矿洞 的传送箭与末影珍珠等）统一走 states/2/give_map_item
function tkot:states/2/give_map_item

execute as @a[team=!debug,gamemode=!spectator] run loot give @s loot tkot:normal_item

effect give @a night_vision infinite 1 true
