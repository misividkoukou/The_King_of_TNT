# 只发给“本局存活”（statu=2）的人；已淘汰(3)和观战(4)自然拿不到
give @a[team=!debug,gamemode=!spectator,scores={statu=2}] minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:1,cooldown_group:"tnt_throw"},minecraft:custom_data={tnt:true},minecraft:consumable={consume_seconds:0,animation:"none",sound:"intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:tnt",minecraft:item_name={"text":"抛射型tnt"}] 1

# 只在战斗阶段续期：回合结束后（#steps 变成 3）自动停手，不会在大厅补发
execute if score #steps int matches 2 run schedule function tkot:states/2/give_item 5s replace
