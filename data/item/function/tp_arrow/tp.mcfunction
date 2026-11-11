# ── 传送箭：落地后把【射箭的人】传送到落点 ──
# ★ 落地字段是 inGround（不是 OnGround —— 箭插在地上时 OnGround 仍是 0b）
# ★ 用箭的 Owner UUID 反查玩家：4 段 int 逐段比较，全等才是射箭的人。
execute as @e[type=minecraft:arrow,nbt={inGround:1b,item:{components:{"minecraft:custom_data":{"teleport_arrow":true}}}}] at @s run function item:tp_arrow/do
