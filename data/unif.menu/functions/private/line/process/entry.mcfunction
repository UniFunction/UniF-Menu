# 复制到缓存
$data modify storage unif.menu:cache Cache.Print.Line set from storage $(storage) $(path)

scoreboard objectives add unif.10000 dummy "Cache"

# 递归处理组件
function unif.menu:private/line/process/loop

scoreboard objectives remove unif.10000