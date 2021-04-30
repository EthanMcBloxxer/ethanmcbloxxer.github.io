# Roblox ModuleScripts

These are extremely simple to understand on a basic level. There is a deeper level of understanding you can achieve, but you don't need to have an immense amount of understanding to use these.

Now, to be blunt, ModuleScripts are functions.

That's it.

Inside of a ModuleScript, you may notice there is a `return` keyword at the end. This is what gets returned when using the `require` keyword.

Say I have the following code in a ModuleScript:

```lua
return "This is a ModuleScript"
```

and this in a Script:

```lua
local module = require(ModuleScript) -- (replace ModuleScript with path)
print(module) --> "This is a ModuleScript"
```

In the Script, you call the ModuleScript and the ModuleScript returns `"This is a ModuleScript"`. That return value is stored in the `module` variable, which we print.

The ModuleScript's code can be thought of more like this:

```lua
function module()
	return "This is a ModuleScript"
end
```

Most use ModuleScripts with tables as return values, like so:

```lua
return {
	say = function(text)
		print(text)
	end,
	addCash = function(player, cash)
		player.leaderstats.Cash.Value += cash -- this is just an example
	end,
}
```

which allows us to do this in Scripts:

```lua
local module = require(ModuleScript)

module.say("Some text is cool") --> "Some text is cool"
module.addCash(game.Players.EthanMcBloxxer, 1000)
```

you may also see table assignments like this, which also works:

```lua
local exports = {}

exports.say(text)
	print(text)
end

return exports
```

and some even utilize [Metatables](metatables).

Another thing to note is that code inside of the ModuleScript will be ran. Functions inside of them don't run automatically (as functions don't run without being called), so you can make code inside of the ModuleScript run on calling:

```lua
print("Ran ModuleScript")

return true
```

which would do the following in a Script:

```lua
local bool = require(ModuleScript) --> Ran ModuleScript
print(tostring(bool)) --> true
```
