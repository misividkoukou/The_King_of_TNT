# ★ 26.3 起 worldborder 的 time 参数单位是【刻】，不是秒！
#   要写 10s（带 s 后缀）才是 10 秒；只写 10 是 10 刻 = 0.5 秒，看起来就像瞬间缩完。
worldborder set 40 10s
tellraw @a {text:"世界边界将在10秒内缩小至40,请撤离！",color:red}
