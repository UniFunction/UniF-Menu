# UniF-Menu

[English](./README.md)

UniF-Menu 是一款用于创建和管理菜单的数据包。

## 使用

UniF-Menu 需要第三方组件去显示一个菜单，以下用 UniF-Widget 组件包演示。组件的具体参数需要自行查询组件包的文档，

本数据包仅提供解析组件的框架。

### 解析一个行

```MCFUNCTION
data modify storage test:menu Data.Line set value []
data modify storage test:menu Data.Line append value {"type":"unif_text","value":{text: "To summon a pig", bold: "true", hover_text: "It is a hover of the text.", "color": "aqua"}}
data modify storage test:menu Data.Line append value {"type":"unif_button","value":{text: "*", hover_text: "It is a hover of the button", click_action: "run_command", click_value: "/summon pig", "color": "gold", bold: "true"}}

# 解析并打印
execute as @p run function #unif.menu:line/v1/parse_line {storage:"test:menu",path:"Data.Line"}
```

以上，会有如下效果

![](https://z1.ax1x.com/2023/10/01/pPLAeaj.png)

### 解析一个页面

```MCFUNCTION
data modify storage test:menu Data.Page set value []

# 第一行
data modify storage test:menu Data.Page append value []
data modify storage test:menu Data.Page[0] append value {"type":"unif_text","value":{text: "It is text widget on Line 1."}}
data modify storage test:menu Data.Page[0] append value {"type":"unif_button","value":{text: "Button1"}}

# 第二行
data modify storage test:menu Data.Page append value []
data modify storage test:menu Data.Page[1] append value {"type":"unif_text","value":{text: "It is text widget on Line 2."}}
data modify storage test:menu Data.Page[1] append value {"type":"unif_button","value":{text: "Button2"}}

# 解析并打印
execute as @p run function #unif.menu:page/v1/parse_page {storage:"test:menu",path:"Data.Menu"}
```

以上，会有如下效果

![](https://z1.ax1x.com/2023/10/01/pPLA3sU.png)

### 添加新组件

一个组件应当包含 `entry` 函数和 `output` 函数，
`entry` 负责输入数据并处理，`output` 应当输出处理后的原始 JSON 文本到存储 `unif.menu:cache` 中的 `Cache.Output.JSONTexts`，

以下是 `unif_text` 的 `entry` 和 `output`

entry 函数：
```MCFUNCTION
# 缺少某些元素自动补全
execute unless data storage unif.menu:cache Cache.Print.Widget.value.text run data modify storage unif.menu:cache Cache.Print.Widget.value.text set value ""
execute unless data storage unif.menu:cache Cache.Print.Widget.value.color run data modify storage unif.menu:cache Cache.Print.Widget.value.color set value "white"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.bold run data modify storage unif.menu:cache Cache.Print.Widget.value.bold set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.italic run data modify storage unif.menu:cache Cache.Print.Widget.value.italic set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.underlined run data modify storage unif.menu:cache Cache.Print.Widget.value.underlined set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.strikethrough run data modify storage unif.menu:cache Cache.Print.Widget.value.strikethrough set value "false"
execute unless data storage unif.menu:cache Cache.Print.Widget.value.obfuscated run data modify storage unif.menu:cache Cache.Print.Widget.value.obfuscated set value "false"

execute unless data storage unif.menu:cache Cache.Print.Widget.value.hover_text run data modify storage unif.menu:cache Cache.Print.Widget.value.hover_text set value ""


function unif.widget:widgets/unif_text/output with storage unif.menu:cache Cache.Print.Widget.value

data remove storage unif.menu:cache Cache.Process.ListIntoJSONTexts
```

output 函数：
```MCFUNCTION
$data modify storage unif.menu:cache Cache.Process.ListIntoJSONTexts set value '{"text":"","color":"white","extra":[{"color":"$(color)","text": "$(text)","bold": "$(bold)","italic": "$(italic)", "strikethrough": "$(strikethrough)", "obfuscated": "$(obfuscated)", "underlined": "$(underlined)","hoverEvent":{"action":"show_text","value":"$(hover_text)"}}]}'
data modify storage unif.menu:cache Cache.Output.JSONTexts append from storage unif.menu:cache Cache.Process.ListIntoJSONTexts
```

可见，在 `entry` 函数中处理了组件的一些默认值，然后通过输入到 `output` 函数中并输出到存储 `unif.menu:cache` 中的 `Cache.Output.JSONTexts`，
```MCFUNCTION
function unif.widget:widgets/unif_text/output with storage unif.menu:cache Cache.Print.Widget.value
```

## 注意事项

不建议在组件的任何值中输入`'`和`"`这两个字符，因为 NBT 参数经过多次传参，所以也需要多次转义：
- `"` 需要转义 `\\\\\\\\\` 这么多次；
- `'` 需要转义 `\\\\\\\\\\\\\\` 这么多次。