# ── 管理员取用：硫方怪 TNT（试验品）──
# 不进任何战利品表，也不在开局发放，只能手动执行：
#     /function item:sulfur_tnt/give
# 组件与 item:advancement/sulfur_tnt_stick 的 custom_data 必须完全一致，
# 否则吃了不会触发投掷（type 写错是最常见的坑）。

give @s minecraft:stick[minecraft:max_stack_size=99,minecraft:use_cooldown={seconds:2,cooldown_group:"sulfur_test"},minecraft:custom_data={tnt:true,type:"sulfur_test"},minecraft:consumable={consume_seconds:0,animation:"none",sound:"minecraft:intentionally_empty",has_consume_particles:false},minecraft:item_model="minecraft:sulfur",minecraft:item_name={"text":"硫方怪TNT（试验）"},minecraft:enchantment_glint_override=true,minecraft:lore=[{text:"扔出一颗装着TNT的硫方怪",color:"aqua"},{text:"弹得离谱，纯测试用",color:"gray"}]] 1
