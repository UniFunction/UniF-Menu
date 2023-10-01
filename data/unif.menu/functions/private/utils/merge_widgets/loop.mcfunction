execute store result score $len unif.10001 run data get storage unif.menu:cache Cache.Process.Merge.OriginalList

# 分离出 Widget1 和 Widget2 两个组件进行合并
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.Merging.Widget1 set from storage unif.menu:cache Cache.Process.Merge.OriginalList[0]
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.Merging.Widget2 set from storage unif.menu:cache Cache.Process.Merge.OriginalList[1]

# 进行合并
execute unless score $len unif.10001 matches ..1 run function unif.menu:private/utils/merge_widgets/merge with storage unif.menu:cache Cache.Process.Merge.Merging

# 将合并完的 MergingOut 替换到 OriginalList[0] 并删除 OriginalList[1]，使两个元素变成一个元素
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.OriginalList[0] set from storage unif.menu:cache Cache.Process.Merge.MergingOut
execute unless score $len unif.10001 matches ..1 run data remove storage unif.menu:cache Cache.Process.Merge.OriginalList[1]
execute unless score $len unif.10001 matches ..1 run data remove storage unif.menu:cache Cache.Process.Merge.MergingOut

execute unless score $len unif.10001 matches ..1 store result score $len unif.10001 run data get storage unif.menu:cache Cache.Process.Merge.OriginalList

# 递归
execute unless score $len unif.10001 matches ..1 run function unif.menu:private/utils/merge_widgets/loop