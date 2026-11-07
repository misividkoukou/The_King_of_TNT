# 只在战斗阶段发放。
# 选择器必须是 @a —— 这个函数是 schedule 调起的，没有实体上下文，写 @s 会直接失败（TNT 发不出来）
# custom_data 里必须有 type:"normal"：进度 normal_tnt_stick 就是按这个区分普通弹 / 瞬爆弹的
execute if score #steps int matches 2 run give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:0.5,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true,type:"normal"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"抛射型tnt"}] 1
# 只在战斗阶段续期：回合结束后（#steps 变成 3）停手，不会在大厅补发
execute if score #steps int matches 2 run schedule function tkot:states/2/give_item 3s replace

effect give @a night_vision infinite 1 true
