# UniF-Menu

[简体中文](./README_zh.md)

UniF-Menu is a data pack used to create and manage menus.

## Usage

UniF-Menu requires third-party widgets to display a menu.

The following example uses the UniF-Widget component package for demonstration.

The specific parameters for the component need to be looked up in the component package's documentation.

This data pack provides only the framework for parsing the widgets.

### Parsing a Line

```MCFUNCTION
data modify storage test:menu Data.Line set value []
data modify storage test:menu Data.Line append value {"type": "unif_text", "value": { "text": "To summon a pig", "bold": "true", "hover_text": "It is a hover of the text.", "color": "aqua" }}
data modify storage test:menu Data.Line append value {"type": "unif_button", "value": { "text": "*", "hover_text": "It is a hover of the button", "click_action": "run_command", "click_value": "/summon pig", "color": "gold", "bold": "true" }}

# Parse and display
execute as @p run function #unif.menu:line/v1/parse_line { "storage": "test:menu", "path": "Data.Line" }

```

The above code will have the following effect:

![](https://z1.ax1x.com/2023/10/01/pPLAeaj.png)

### Parsing a Page

```MCFUNCTION
data modify storage test:menu Data.Page set value []

# First Line
data modify storage test:menu Data.Page append value []
data modify storage test:menu Data.Page[0] append value {"type": "unif_text", "value": { "text": "It is text widget on Line 1." }}
data modify storage test:menu Data.Page[0] append value {"type": "unif_button", "value": { "text": "Button1" }}

# Second Line
data modify storage test:menu Data.Page append value []
data modify storage test:menu Data.Page[1] append value {"type": "unif_text", "value": { "text": "It is text widget on Line 2." }}
data modify storage test:menu Data.Page[1] append value {"type": "unif_button", "value": { "text": "Button2" }}

# Parse and display
execute as @p run function #unif.menu:page/v1/parse_page { "storage": "test:menu", "path": "Data.Menu" }
```

The above code will have the following effect:

![](https://z1.ax1x.com/2023/10/01/pPLA3sU.png)

### Adding a New Widget

A component should include `entry` and `output` functions. The `entry` function is responsible for inputting data and processing it, while the `output` function should `output` the processed raw JSON text to `unif.menu:cache` in `Cache.Output.JSONTexts`.

Here is an example of the `entry` and `output` functions for `unif_text`:


Entry Function:
```MCFUNCTION
# Automatically fill in missing elements
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

Output Function:

```MCFUNCTION
$data modify storage unif.menu:cache Cache.Process.ListIntoJSONTexts set value '{"text":"","color":"white","extra":[{"color":"$(color)","text": "$(text)","bold": "$(bold)","italic": "$(italic)", "strikethrough": "$(strikethrough)", "obfuscated": "$(obfuscated)", "underlined": "$(underlined)","hoverEvent":{"action":"show_text","value":"$(hover_text)"}}]}'
data modify storage unif.menu:cache Cache.Output.JSONTexts append from storage unif.menu:cache Cache.Process.ListIntoJSONTexts
```

As you can see, the `entry` function handles some default values for the widget and then passes them to the `output` function through:

```MCFUNCTION
function unif.widget:widgets/unif_text/output with storage unif.menu:cache Cache.Print.Widget.value
```

## Notes
It is not recommended to input the characters `'` and `"` into any values of the widgets because NBT parameters are passed multiple times, so they need to be escaped multiple times:
- `"` needs to be escaped `\\\\\\\\\` times.
- `'` needs to be escaped `\\\\\\\\\\\\\\` times.