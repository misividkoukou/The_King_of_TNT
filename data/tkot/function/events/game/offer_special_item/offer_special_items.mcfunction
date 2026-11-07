# 只发给本局参战者：大厅里的人开战瞬间已被 in_game 转成 statu=4 观战，
# 但他们仍然在 @a 里，不加限定会连观战者一起发。
loot give @a[team=!debug,gamemode=!spectator,scores={statu=2}] loot tkot:special_item
