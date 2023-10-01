data modify storage test:menu Data.Menu set value []

data modify storage test:menu Data.Menu append value {"type":"text","value":{text: "To summon a pig", bold: "true", hover_text: "It is a hover of the text.", "color": "aqua"}}
data modify storage test:menu Data.Menu append value {"type":"button","value":{text: "*", hover_text: "It is a hover of the button", click_action: "run_command", click_value: "/summon pig", "color": "gold", bold: "true"}}

function unif.menu:private/line/process {storage:"test:menu",path:"Data.Menu"}