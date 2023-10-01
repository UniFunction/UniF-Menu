data remove storage unif.menu:cache Cache.Print

# 复制到缓存
$data modify storage unif.menu:cache Cache.Print.Page set from storage $(storage) $(path)

scoreboard objectives add unif.10002 dummy "Cache"
gamerule maxCommandChainLength 2147483647

# 递归处理行
function unif.menu:private/page/process/loop

gamerule maxCommandChainLength 65536
scoreboard objectives remove unif.10002