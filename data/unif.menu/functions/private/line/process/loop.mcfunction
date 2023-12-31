# 获取剩余组件数量
execute store result score $widgets unif.10000 run data get storage unif.menu:cache Cache.Print.Line

data modify storage unif.menu:cache Cache.Print.Widget set from storage unif.menu:cache Cache.Print.Line[0]

data remove storage unif.menu:cache Cache.Print.Line[0]

# 不为 0 继续处理
execute unless score $widgets unif.10000 matches 0 run function unif.menu:private/line/process/type_process with storage unif.menu:cache Cache.Print.Widget

data remove storage unif.menu:cache Cache.Print.Widget

# 为 0 跳出递归
execute unless score $widgets unif.10000 matches 0 run function unif.menu:private/line/process/loop