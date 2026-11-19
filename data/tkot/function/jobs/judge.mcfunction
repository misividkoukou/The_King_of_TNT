# ── 职业分发（上下文 = 玩家）──
# 由 jobs/player 对每名参战玩家调用；没选职业（job 不存在 / 被 states/reset 清掉）的人什么都不发。
#
# job 分值对照：#1 旋风人 2炸弹人 3 无影
#
# ★ 新增一个职业 = 只改这 4 处（不再有第 5 处硬编码）：
#   ① jobs/give_item/jobN.mcfunction   新建发放函数（照着 job1..3 写）
#   ② 本文件                           加一行 execute if score @s job matches N run function tkot:jobs/give_item/jobN
#   ③ jobs/read.mcfunction             加两行：trigger 分值 → job 分值的赋值、以及选择成功的提示
#      （trigger 分值 = job 分值 + 1：因为 trigger 1 被"重开面板"占用，所以新职业写 trigger N+1）
#   ④ jobs/bar.mcfunction              面板里加一个按钮，command 写 trigger job_trigger set <N+1>
#   面板文案只维护 jobs/bar 一份，jobs/bar_self 只是转发，不用改。
execute if score @s job matches 1 run function tkot:jobs/give_item/job1
execute if score @s job matches 2 run function tkot:jobs/give_item/job2
execute if score @s job matches 3 run function tkot:jobs/give_item/job3
