# 先将 JSONTexts 复制到 Merge.OriginalList
data modify storage unif.menu:cache Cache.Process.Merge.OriginalList set from storage unif.menu:cache Cache.Output.JSONTexts

scoreboard objectives add unif.10001 dummy "Cache"

# 递归合并
function unif.menu:private/utils/merge_widgets/loop

scoreboard objectives remove unif.10001

data modify storage unif.menu:cache Cache.Output.Merged set from storage unif.menu:cache Cache.Process.Merge.OriginalList[0]
data remove storage unif.menu:cache Cache.Process.Merge