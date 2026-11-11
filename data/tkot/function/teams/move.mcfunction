# 把 $(from) 队里的一个人挪到 $(to) 队
# 宏可以直接把队伍名替换进 team 参数和选择器，所以不用写 4×4 的分支
$team join $(to) @a[team=$(from),scores={statu=1..2},limit=1]
