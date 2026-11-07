# 收回进度：不撤销的话 consume_item 只会触发一次，第二个信标就失效了
advancement revoke @s only item:heal_pool

# ① 计时实体：Marker + 不可见 + 无敌，玩家看不到也碰不到
#    由 item:heal_pool/sec1 每秒 +1，到 5 秒时调 kill 清掉
execute as @s run summon minecraft:armor_stand ~ ~ ~ {Tags:["heal_pool"],Marker:1b,Invisible:1b,Invulnerable:1b}

# ② 治疗云：存在 5 秒（100 tick），每 20 tick 重新给一次效果
#    效果本身给 40 tick（2 秒）→ 站在范围里持续回血，走出范围后还有 2 秒余韵
#
#    注意：Duration 和效果 duration 都不能写 1。
#    生命恢复是按"效果内部计时器"周期性回血的，duration:1 根本到不了第一次回血就结束了，
#    表现就是"放了治疗池但一点血都不回"。
execute as @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["heal_pool_cloud"],Duration:100,DurationOnUse:0,Radius:5,RadiusOnUse:0,RadiusPerTick:0,ReapplicationDelay:20,WaitTime:0,potion_contents:{custom_color:14944959,custom_effects:[{id:"minecraft:regeneration",ambient:false,amplifier:3,duration:40,show_icon:true,show_particles:true}]}}
