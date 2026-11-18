# ── 补记生涯参与次数（上下文 = 玩家）──
# 由 states/overall/tick1 在战斗阶段（#steps=2）里，对"本局身份仍有效、
# 但还没计过参与"的人调用。
#
# 覆盖场景：上台后被定格成 statu=2，但在开场 5 秒里掉线、开战之后才重连回来的人。
# 1→2 统一 +1 的那一刻他们不在线，所以这里补一次；
# round_counted 标记保证"只补一次"，反复掉线重连也不会重复计。
scoreboard players add @s player_round 1
tag @s add round_counted
