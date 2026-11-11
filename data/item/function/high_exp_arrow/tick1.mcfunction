# 爆炸箭：每 tick 先给空中/插住的箭打标记，再检测落地引爆
# 注意：这里是 high（威力 4）版本，不能用 low 的 mark/summon —— 两个版本靠不同的 tag 区分。
function item:high_exp_arrow/mark
function item:high_exp_arrow/summon_tnt
