# ── 随机事件池（宏执行部分）──
# 宏参数：$(early) = early 池上限、$(rollmax) = late 池上限、$(unlock) = 解锁分钟数
#
# ★ 用 if / unless 配对，避免 min == unlock 时两条都成立、后一条覆盖前一条。
#   unless ... matches $(unlock)..  ==  (#game_min_timer < unlock)
#   if     ... matches $(unlock)..  ==  (#game_min_timer >= unlock)
#
# ★ 再次强调：#game_min_timer 必须【存在】（load / reset 里 set 0），
#   否则这两个判断全不成立，整段跳过、#events 保持旧值 → 重放上一次事件。
$execute unless score #game_min_timer int matches $(unlock).. if score #vote_ready int matches 0 if score #steps int matches 2 run execute store result score #events int run random value 1..$(early)
$execute if score #game_min_timer int matches $(unlock).. if score #vote_ready int matches 0 if score #steps int matches 2 run execute store result score #events int run random value 1..$(rollmax)
