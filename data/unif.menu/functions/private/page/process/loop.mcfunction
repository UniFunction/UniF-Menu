# 获取剩余行数量
execute store result score $lines unif.10002 run data get storage unif.menu:cache Cache.Print.Page

data modify storage unif.menu:cache Cache.Print.Line set from storage unif.menu:cache Cache.Print.Page[0]

data remove storage unif.menu:cache Cache.Print.Page[0]

# 不为 0 继续处理
execute unless score $lines unif.10002 matches 0 run function #unif.menu:line/v1/parse_line {storage:"unif.menu:cache",path:"Cache.Print.Line"}

# 获取剩余行数量
execute store result score $lines unif.10002 run data get storage unif.menu:cache Cache.Print.Page

# 为 0 跳出递归
execute unless score $lines unif.10002 matches 0 run function unif.menu:private/page/process/loop