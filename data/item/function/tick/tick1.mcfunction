# ── 每 tick 循环 ──
# 爆炸箭（两种威力，各自独立打标记/引爆）
function item:low_exp_arrow/tick1
function item:high_exp_arrow/tick1
function item:arrow_damage
function item:tp_arrow/tp
function item:trap/tick1
# 落地即炸的 TNT：贴地就把 fuse 改成 1
function item:instant_tnt/meet_ground
# 弹跳 TNT：贴地且正在下落时上弹，弹满 3 次退化成普通 TNT
function item:bounce_tnt/tick

schedule function item:tick/tick1 1t replace
