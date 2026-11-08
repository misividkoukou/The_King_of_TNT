# 每 3 秒给参战者补一件普通物资
# player 内部按 statu=2 过滤，所以非战斗阶段自动空转，不需要额外判断
function tkot:events/game/offer_normal_item/player

schedule function tkot:ticks/sec3 3s replace
