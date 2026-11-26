# 第一次进服的玩家
# joined 是永久标记，只打一次；身份全部靠 statu 分数（0=大厅）
tag @s add joined
scoreboard players set @s statu 0
scoreboard players set @s round 0
scoreboard players set @s player_round 0
scoreboard players set @s player_win 0
scoreboard players set @s total.death 0
# 生涯总击杀 + 单局击杀都要先建好，否则新人的 scores={kill=..} / 面板取值会读到空值
scoreboard players set @s total.kill 0
scoreboard players set @s kill 0
# 保证 death 这项一定存在，否则 scores={death=1..} 对新人永远不成立
scoreboard players add @s death 0

# 编辑快捷栏：分配固定编号（storage tkot:loadout 的键）+ 默认在大厅区域
# 计数器在独立计分板 pid 里，不会被 /reload 清零
scoreboard players add #pid_next pid 1
execute store result score @s p_id run scoreboard players get #pid_next pid
scoreboard players set @s area 0

gamemode adventure @s

# 大厅传送点统一在 lobby/tp_point 里维护；单人用 tp_self（它内部就是调 tp_point）
function tkot:lobby/tp_self
tellraw @s ["",{"text":"欢迎来到 TKOT！\n","color":"gold","bold":true},{"text":"本小游戏由 ","color":"gray"},{"text":"misivid_koukou","color":"yellow"},{"text":" 开发\n遇到 Bug 欢迎前往 ","color":"gray"},{"text":"[GitHub]","color":"aqua","underlined":true,"click_event":{"action":"open_url","url":"https://github.com/misividkoukou/The_King_of_TNT/issues"},"hover_event":{"action":"show_text","value":" 提交 Issue "}},{"text":" 提交反馈。\n\n","color":"gray"},{"text":"欢迎加入内测群聊语音：","color":"gold"},{"text":"\n"},{"text":"196181438","color":"yellow","bold":true,"underlined":true,"click_event":{"action":"copy_to_clipboard","value":"196181438"},"hover_event":{"action":"show_text","value":"点击复制群号 196181438"}},{"text":"\n\n"},{"text":"[ 查看图鉴 ]","color":"aqua","bold":true,"click_event":{"action":"run_command","command":"trigger guide_trigger set 1"},"hover_event":{"action":"show_text","value":"点击查看 道具 / 职业 / 地图 / 模式"}}]
playsound entity.villager.yes master @s
