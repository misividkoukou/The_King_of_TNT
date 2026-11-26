# 兼容入口：历史上有两个逐字相同的职业面板文件（bar / bar_self）。
# 现在只维护 jobs/bar 一份，这里转发过去，避免两份文案各自漂移。
# 注意：function 会继承调用者的命令上下文（包括 @s），所以 tellraw @s 的行为不变。
function tkot:jobs/bar
