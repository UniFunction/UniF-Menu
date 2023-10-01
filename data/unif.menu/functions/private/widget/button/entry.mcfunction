# 缺少某些元素自动补全
execute unless data storage unif.menu:cache Cache.Print.Widget.value.text run data modify storage unif.menu:cache Cache.Print.Widget.value.text set value ""
execute unless data storage unif.menu:cache Cache.Print.Widget.value.color run data modify storage unif.menu:cache Cache.Print.Widget.value.color set value "white"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.bold run data modify storage unif.menu:cache Cache.Print.Widget.value.bold set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.italic run data modify storage unif.menu:cache Cache.Print.Widget.value.italic set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.underlined run data modify storage unif.menu:cache Cache.Print.Widget.value.underlined set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.strikethrough run data modify storage unif.menu:cache Cache.Print.Widget.value.strikethrough set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.obfuscated run data modify storage unif.menu:cache Cache.Print.Widget.value.obfuscated set value "false"

execute unless data storage unif.menu:cache Cache.Print.Widget.value.hover_text run data modify storage unif.menu:cache Cache.Print.Widget.value.hover_text set value ""

execute unless data storage unif.menu:cache Cache.Print.Widget.value.click_action run data modify storage unif.menu:cache Cache.Print.Widget.value.click_action set value "run_command"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.click_value run data modify storage unif.menu:cache Cache.Print.Widget.value.click_value set value ""


function unif.menu:private/widget/button/output with storage unif.menu:cache Cache.Print.Widget.value

data remove storage unif.menu:cache Cache.Process.ListIntoJSONTexts