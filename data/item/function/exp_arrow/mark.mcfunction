# 给「用爆炸箭射出的箭」打上 exp_bow 标记
# 由 item:exp_arrow/tick1 每 tick 在 summon_tnt 之前调用。
#
# 判定方式：箭实体身上带着发射它的那个物品堆叠，字段名是【小写 item】。
# 实测 NBT（26.3）：
#   item: {id: "minecraft:arrow", count: 1, components: {"minecraft:custom_data": {exp_arrow: 1b}, ...}}
# 注意：不是 Item（大写）—— 大写版本在 26.3 里匹配不到任何实体。
tag @e[type=arrow,nbt={item:{components:{"minecraft:custom_data":{exp_arrow:1b}}}}] add exp_bow
