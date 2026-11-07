#暂时是每30s发放一次,后面做成多个事件抽取一个
execute if score #steps int matches 2 run function tkot:events/game/offer_special_item/random
