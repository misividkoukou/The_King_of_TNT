# 大厅传送点 —— 仅执行者（首次进服的引导用）
# 和 tp_all.mcfunction 保持一致；同样带“大厅存在才传送”的保护
execute if score #lobby_ok int matches 1 run tp @s 6 -55 204 facing 24 -55 -24
