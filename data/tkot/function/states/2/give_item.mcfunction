#Game Intro
tellraw @a [{"text":"--------------------------------","color":"gold","bold":true},{"text":"\n"},{"text":" TNT之王","color":"dark_green","bold":true},{"text":"\n"},{"text":"使用道具将其他玩家炸死或者丢入虚空吧，不准炸koukou :(","bold":true},{"text":"\n"},{"text":"--------------------------------","color":"gold","bold":true}]

# 只在战斗阶段发放。
give @a[team=!debug,gamemode=!spectator] minecraft:crossbow[unbreakable={},minecraft:custom_data={crossbow:true},minecraft:item_name={"text":"永恒之驽"},minecraft:item_model="minecraft:crossbow",minecraft:lore=[{text:"实际上箭类物品都需要用我打出去!",color:"aqua"}]]

effect give @a night_vision infinite 1 true
