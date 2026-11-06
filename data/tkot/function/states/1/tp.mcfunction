#强制冻结玩家（原地、保留朝向）
# 逐人 as/at 才能把每个人钉在他自己的位置上；直接 tp @a ~ ~ ~ 会把所有人叠到命令源那一点。
execute as @a at @s run tp @s ~ ~ ~

# 黑暗效果：只用 blindness（稳定的黑屏）。
# 不要用 darkness —— 它天生是一明一暗的脉冲效果，看起来就是在闪。
# 只对参战者（statu=2）生效，大厅里没准备的人不受影响。
effect give @a[scores={statu=2}] blindness 10 1 true
effect give @a[scores={statu=2}] slowness 10 1 true

# 身份在 0→1 转场时就写成 statu=2 了，这里不再打任何 tag
schedule function tkot:states/1/tp 1t replace
