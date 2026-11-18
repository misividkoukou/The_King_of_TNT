# ── 阴魂不散：在地图上随机生成 5 颗高爆 TNT ──
# 生成次数放在 #tnt_left，由 spawn_one 递归消耗（每次重新抽坐标）。
scoreboard players set #tnt_left int 5

function tkot:events/game/summon_tnt/spawn_one

schedule function tkot:events/game/summon_tnt/announce 1s replace
