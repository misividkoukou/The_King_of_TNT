execute store result score #special_item int run random value 1..10

execute if score #special_item int matches 1..2 run tellraw @a [{text:"本轮道具发放失败了，因为koukou很伤心 :) ",color:red},{text:"\n"},{text:"这太烧心了BRO",strikethrough:true,color:gray}]
execute if score #special_item int matches 3..10 run function tkot:events/game/offer_special_item/player