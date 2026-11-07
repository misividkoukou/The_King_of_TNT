# ── 落点：暂时固定（分散函数以后再写）──
# 所有参战玩家统一落在场地中心 (x, y_spawn, z)。
# 以后写分散函数时，把下面第一行换掉即可，其余不用动。
# 原来的写法（留作参考）：
# $tp @a[team=!debug,gamemode=!spectator] $(x) $(y_spawn) $(z)
$spreadplayers $(x) $(z) 5 $(range) true @a[team=!debug,gamemode=!spectator]
# 调试队送到观察点
$tp @a[team=debug] $(x) $(y_debug) $(z)

# 每局开始发 1 个瞬爆弹（普通弹由 give_item 每 3 秒补）
# custom_data 里的 type:"instant" 是 instant_tnt_stick 进度识别的依据
give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"instant"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"瞬爆型tnt"}] 1

# 每局开始发 1 个多重射击弹（一次打出 3 颗普通 TNT）
give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"multishot"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"多重射击tnt"}] 1

title @a[team=!debug,gamemode=!spectator] title {"text":"开始战斗! 物资将在五秒后开始发放","color":"red"}

# 5 秒后开始发物资
schedule function tkot:states/2/give_item 5s replace
