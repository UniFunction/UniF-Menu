data modify storage test:menu Data.Menu set value []

data modify storage test:menu Data.Menu append value {"type":"text","value":{"text":"Text Widget 1",bold:"true",hover_text:"It is a hover.","color":"aqua"}}
data modify storage test:menu Data.Menu append value {"type":"text","value":{"text":"Text Widget 2","underlined":"true"}}
data modify storage test:menu Data.Menu append value {"type":"text","value":{"text":"Text Widget 3","strikethrough":"true"}}
data modify storage test:menu Data.Menu append value {"type":"text","value":{"text":"Text Widget 4","italic":"true","underlined":"true"}}

function unif.menu:private/line/process {storage:"test:menu",path:"Data.Menu"}