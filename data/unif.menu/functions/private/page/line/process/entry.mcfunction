# 复制到 Cache
$data modify storage unif.menu:cache Cache.Print.Line set from storage $(storage) $(path)

tellraw @a ["Type: ",{"nbt":"Cache.Print.Line[].type","storage": "unif.menu:cache"}]

# 清空 Output
data remove storage unif.menu:cache Cache.Process.ListIntoJSONTexts
data remove storage unif.menu:cache Cache.Output.JSONTexts

scoreboard objectives add unif.10000 dummy "Cache"

# 递归处理 Widgets
function unif.menu:private/page/line/process/loop

scoreboard objectives remove unif.10000
data remove storage unif.menu:cache Cache.Print.Widget
data remove storage unif.menu:cache Cache.Print.Line