$data modify storage unif.menu:cache Cache.Process.ListIntoJSONTexts set value '{"clickEvent":{"action":"$(click_action)","value":"$(click_value)"},"text":"","color":"white","extra":[{"text":"[","color":"$(color)"},{"color":"$(color)","text": "$(text)","bold": "$(bold)","italic": "$(italic)", "strikethrough": "$(strikethrough)", "obfuscated": "$(obfuscated)", "underlined": "$(underlined)","hoverEvent":{"action":"show_text","value":"$(hover_text)"}},{"text":"]","color":"$(color)"}]}'
data modify storage unif.menu:cache Cache.Output.JSONTexts append from storage unif.menu:cache Cache.Process.ListIntoJSONTexts