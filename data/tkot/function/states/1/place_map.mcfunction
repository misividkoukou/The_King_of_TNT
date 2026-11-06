# 开战前铺图：由 states/1/game_prepare 用 schedule 延后 2 tick 调用，
# 因为 maps/pick 里的 forceload 刚加上时区块还没真正加载。
function tkot:states/3/place_quiet with storage tkot:map
