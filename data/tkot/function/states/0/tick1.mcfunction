scoreboard players set @a statu 0

# ── 准备台 ──
# 绿台：任何模式都能用来准备（单人混战 / 系统分组 只认这一块）
execute as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-1 ~ green_concrete run function tkot:states/0/pad/green
execute as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-2 ~ green_concrete run function tkot:states/0/pad/green

# 红 / 黄 / 蓝台：只有【自选分组】（#gamemode 3）才生效
# 单人混战 / 系统分组 下站在这些台子上不算准备，队伍由系统决定
execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-1 ~ red_concrete run function tkot:states/0/pad/red
execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-2 ~ red_concrete run function tkot:states/0/pad/red

execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-1 ~ yellow_concrete run function tkot:states/0/pad/yellow
execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-2 ~ yellow_concrete run function tkot:states/0/pad/yellow

execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-1 ~ blue_concrete run function tkot:states/0/pad/blue
execute if score #gamemode int matches 3 as @a[team=!debug,gamemode=!spectator] at @s if block ~ ~-2 ~ blue_concrete run function tkot:states/0/pad/blue

# ── 没站在准备台上的人 → 清掉队伍 ──
# 上面所有 pad 函数都会把 statu 设成 1；所以 statu 还是 0 就说明他现在不在任何台子上。
# 自选分组模式下，离开台子就退队；他自己重新站上去会重新入队。
team leave @a[team=!debug,scores={statu=0}]
