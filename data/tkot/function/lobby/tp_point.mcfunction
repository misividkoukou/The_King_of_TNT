# 大厅传送点 —— 唯一维护位置
# 换大厅坐标时要同时改两处：
#   ① states/3/place_lobby.mcfunction  里的 place template 落点（结构原点）
#   ② 本文件里的 tp 坐标（人站的位置）
# tp_all / tp_self 都只是调用本文件，不再各自写坐标。
execute if score #lobby_ok int matches 1 run tp @s 6 -55 204 facing 24 -55 -24
