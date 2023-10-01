$function unif.menu:private/line/process/entry {storage:"$(storage)",path:"$(path)"}
function unif.menu:private/utils/merge_widgets/entry

data modify storage unif.menu:cache Cache.Output.Message set from storage unif.menu:cache Cache.Output.Merged
data remove storage unif.menu:cache Cache.Output.Merged
data remove storage unif.menu:cache Cache.Output.JSONTexts

function unif.menu:private/printer with storage unif.menu:cache Cache.Output

data remove storage unif.menu:cache Cache.Output.Message