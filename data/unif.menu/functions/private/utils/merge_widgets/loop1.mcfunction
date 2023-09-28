execute store result score $len unif.10001 run data get storage unif.menu:cache Cache.Process.Merge.P1

# 分离出 w1 和 w2 两个 widget 进行合并
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.P2.w1 set from storage unif.menu:cache Cache.Process.Merge.P1[0]
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.P2.w2 set from storage unif.menu:cache Cache.Process.Merge.P1[1]

# 进行合并
execute unless score $len unif.10001 matches ..1 run function unif.menu:private/utils/merge_widgets/merge with storage unif.menu:cache Cache.Process.Merge.P2

# 将合并完的 P2Out 替换 P1[0] 并删除 P1[1]，使两个元素变成一个元素
execute unless score $len unif.10001 matches ..1 run data modify storage unif.menu:cache Cache.Process.Merge.P1[0] set from storage unif.menu:cache Cache.Process.Merge.P2Out
execute unless score $len unif.10001 matches ..1 run data remove storage unif.menu:cache Cache.Process.Merge.P1[1]
execute unless score $len unif.10001 matches ..1 run data remove storage unif.menu:cache Cache.Process.Merge.P2Out

execute unless score $len unif.10001 matches ..1 store result score $len unif.10001 run data get storage unif.menu:cache Cache.Process.Merge.P1

# 递归
execute unless score $len unif.10001 matches ..1 run function unif.menu:private/utils/merge_widgets/loop1