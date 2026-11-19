# ── 硫方怪 TNT（试验品）：吃道具触发的入口（上下文 = 玩家）──
# 只负责"收回进度"，投射逻辑全部在 sulfur_tnt/test 里（与管理员试射共用一份）。
# 进度是 consume_item：不 revoke 的话只能扔第一次。
#
# ★ 这个物品【不进任何战利品表/开局发放】，只能管理员用：
#     /function item:sulfur_tnt/give    取一个
#     /function item:sulfur_tnt/test    不吃道具，直接按视线投一颗（排查用）
#
# ★ 动了 advancement 之后，必须【退出并重新进入存档】才会扫描到新的 criteria，
#   只 /reload 的话吃了没反应 —— 这是"召唤无效"最常见的原因。

advancement revoke @s only item:sulfur_tnt_stick

function item:sulfur_tnt/test
