$data modify storage unif.menu:cache Cache.Process.ListIntoJSONTexts set value '{"text":"","color":"white","extra":[{"color":"$(color)","text": "$(text)","bold": "$(bold)","italic": "$(italic)", "strikethrough": "$(strikethrough)", "obfuscated": "$(obfuscated)", "underlined": "$(underlined)","hoverEvent":{"action":"show_text","value":"$(hover_text)"}}]}'
data modify storage unif.menu:cache Cache.Output.JSONTexts append from storage unif.menu:cache Cache.Process.ListIntoJSONTexts