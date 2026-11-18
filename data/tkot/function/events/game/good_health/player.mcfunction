# 增生药剂：逐个参战者抬高血量上限
# ★ 原来这里写的是 run function tkot:events/game/good_health/player（自己调自己），
#   会无限递归、只会刷错误，血量一点都不会变。正确入口是本目录的 set。
execute as @a[gamemode=!spectator,scores={statu=2}] run function tkot:events/game/good_health/set
