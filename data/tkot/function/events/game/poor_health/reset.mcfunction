# 脆皮五花结束：还原血量上限，并补满
# ★ 必须用 @s：原来写成 @p 会治到"离命令源最近的人"，而不是中招的这个人
attribute @s max_health base reset
effect give @s minecraft:instant_health 1 255
tag @s remove attr_poor_health
